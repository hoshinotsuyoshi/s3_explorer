# frozen_string_literal: true

# presigned_url controller class.
module S3Object
  class FileController < ApplicationController
    protect_from_forgery with: :null_session

    def show
      file_id = params[:id]
      file = S3Object::File.new({ key: file_id }, bucket: params[:bucket_id])
      @presigned_url = S3Object::PresignedUrl.new(file).to_s
    end
  end
end
