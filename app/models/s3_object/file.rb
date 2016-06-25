# frozen_string_literal: true
module S3Object
  class File
    include ActiveModel::Model

    def self.select(bucket:, prefix:)
      s3 = Aws::S3::Client.new
      resp = s3.list_objects_v2(bucket: bucket, prefix: prefix)
      resp.contents.select do |content|
        !Regexp.last_match(1).include?('/') if content.key =~ /\A#{prefix}([\s\S]*)\z/
      end.map do |file|
        new(file)
      end
    end

    def initialize(file)
      @file = file
    end

    def key
      ::File.basename @file.key
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
