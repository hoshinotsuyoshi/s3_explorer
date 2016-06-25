# frozen_string_literal: true
module S3Object
  class Folder
    include ActiveModel::Model

    DELIMITER = '/'

    def self.select(bucket:, prefix:)
      s3 = Aws::S3::Client.new
      resp = s3.list_objects_v2(
        bucket: bucket,
        prefix: prefix,
        delimiter: DELIMITER
      )
      resp.common_prefixes.map do |common_prefix|
        new(common_prefix)
      end
    end

    def initialize(prefix)
      @prefix = prefix
    end

    def prefix
      @prefix.prefix
    end

    def ==(other)
      if other.is_a? self.class
        prefix == other.prefix
      else
        super
      end
    end
  end
end
