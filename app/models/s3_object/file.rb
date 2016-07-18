# frozen_string_literal: true
module S3Object
  # s3 file object.
  class File
    include ActiveModel::Model

    class << self
      def select(bucket:, prefix:)
        select_child_contents_by_prefix(
          bucket: bucket,
          prefix: prefix
        ).map do |file|
          new(file, bucket: bucket)
        end
      end

      private

      def select_child_contents_by_prefix(bucket:, prefix:)
        s3 = Aws::S3::Client.new
        resp = s3.list_objects_v2(bucket: bucket, prefix: prefix)
        resp.contents.select do |content|
          content.key =~ /\A#{prefix}([\s\S]*)\z/ &&
            !Regexp.last_match(1).include?('/')
        end
      end
    end

    def initialize(file, bucket: nil)
      @file = file
      @bucket = bucket
    end

    def persisted?
      true
    end

    attr_reader :bucket

    alias bucket_id bucket

    def prefix_id
      @file[:key]
    end

    alias prefix prefix_id

    def id
      CGI.escape prefix_id
    end

    def presigned_url
      PresignedUrl.new(self)
    end

    def key
      ::File.basename prefix_id
    end

    def ==(other)
      if other.is_a? self.class
        key == other.key
      else
        super
      end
    end
  end
end
