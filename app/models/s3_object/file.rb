# frozen_string_literal: true
module S3Object
  class File
    include ActiveModel::Model

    def self.select(bucket:, prefix:)
      s3 = Aws::S3::Client.new
      resp = s3.list_objects_v2(bucket: bucket, prefix: prefix)
      resp.contents.select do |content|
        if content.key =~ %r(\A#{prefix}([\s\S]*)\z)
          !$1.include?('/')
        end
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
