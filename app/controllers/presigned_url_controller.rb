# frozen_string_literal: true

# presigned_url controller class.
class PresignedUrlController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    presigned_url = S3Object::PresignedUrl.new(
      bucket: params[:bucket_id],
      prefix: params[:prefix_id]
    )
    @presigned_url = presigned_url.to_s
  end
end
