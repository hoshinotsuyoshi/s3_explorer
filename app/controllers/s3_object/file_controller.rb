# frozen_string_literal: true

module S3Object
  # s3-file controller class.
  class FileController < ApplicationController
    protect_from_forgery with: :null_session

    def show
      file_id = CGI.unescape(params[:id])
      file = S3Object::File.new({ key: file_id }, bucket: params[:bucket_id])
      @presigned_url = file.presigned_url
    end
  end
end
