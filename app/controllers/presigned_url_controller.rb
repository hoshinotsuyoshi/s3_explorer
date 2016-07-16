# frozen_string_literal: true

# presigned_url controller class.
class PresignedUrlController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    file = S3Object::File.new(
      { key: params[:prefix_id] },
      bucket: params[:bucket_id]
    )
    @presigned_url = file.presigned_url
  end
end
