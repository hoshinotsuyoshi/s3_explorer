# frozen_string_literal: true
class PrefixController < ApplicationController
  before_action :set_bucket, only: :show
  before_action :set_s3_objects, only: :show

  def show
    add_breadcrumb @bucket.name, bucket_path(@bucket)

    prefixes = []

    prefix = CGI.unescape(params[:prefix_id].to_s)

    prefix.split('/').each do |pref|
      prefixes << pref
      add_breadcrumb pref, "/buckets/#{@bucket.name}"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bucket
    @bucket = Bucket.find(params[:bucket_id])
  end

  def set_s3_objects
    @files = S3Object::File.select(
      bucket: params[:bucket_id],
      prefix: params[:prefix_id]
    )
    @folders = S3Object::Folder.select(
      bucket: params[:bucket_id],
      prefix: params[:prefix_id]
    )
  end
end
