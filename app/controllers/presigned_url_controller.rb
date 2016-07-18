# frozen_string_literal: true

# presigned_url controller class.
class PresignedUrlController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    file_id = params[:file_id]
    file = S3Object::File.new({ key: file_id }, bucket: params[:bucket_id])
    @presigned_url = S3Object::PresignedUrl.new(file).to_s
  end
end
