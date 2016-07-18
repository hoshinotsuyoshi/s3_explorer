# frozen_string_literal: true
module S3Object
  # s3 Presigned URL.
  # see http://docs.aws.amazon.com/sdkforruby/api/Aws/S3/Presigner.html
  class PresignedUrl
    include ActiveModel::Model

    def initialize(file)
      @file = file
    end

    # presigned full-path url
    # @return [String] presigned url to get the file
    def to_s
      s3 = Aws::S3::Client.new
      signer = Aws::S3::Presigner.new(client: s3)
      signer.presigned_url(:get_object,
                           bucket: bucket,
                           key: CGI.unescape(prefix),
                           expires_in: 1.day,
                           secure: true)
    end

    delegate :bucket, :prefix, to: :@file
  end
end
