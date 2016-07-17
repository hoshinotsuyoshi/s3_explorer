# frozen_string_literal: true

# presigned_url controller class.
class PresignedUrlController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    prefix = params[:prefix_id]
    file = S3Object::File.new({ key: prefix }, bucket: params[:bucket_id])
    @presigned_url = S3Object::PresignedUrl.new(file).to_s
  end
end
