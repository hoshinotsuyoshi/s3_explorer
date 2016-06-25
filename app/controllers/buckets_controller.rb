# frozen_string_literal: true
class BucketsController < ApplicationController
  before_action :set_bucket, only: :show
  before_action :set_s3_objects, only: :show

  # GET /buckets
  # GET /buckets.json
  def index
    @buckets = Bucket.all
  end

  # GET /buckets/1
  # GET /buckets/1.json
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bucket
    @bucket = Bucket.find(params[:id])
  end

  def set_s3_objects
    @files = S3Object::File.select(
      bucket: params[:id],
      prefix: params[:prefix]
    )
    @folders = S3Object::Folder.select(
      bucket: params[:id],
      prefix: params[:prefix]
    )
  end
end
