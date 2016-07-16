# frozen_string_literal: true

# prefix controller class.
class PrefixController < ApplicationController
  before_action :set_bucket, only: :show
  before_action :set_s3_objects, only: :show
  before_action :set_breadcrumbs, only: :show

  def show
  end

  private

  def set_bucket
    @bucket = Bucket.find(bucket_id)
  end

  def set_s3_objects
    @files = S3Object::File.select(
      bucket: bucket_id,
      prefix: prefix_id
    )
    @folders = S3Object::Folder.select(
      bucket: bucket_id,
      prefix: prefix_id
    )
  end

  def set_breadcrumbs
    add_breadcrumb @bucket.name, bucket_path(@bucket)

    prefixes = []

    safe_prefix.split('/').each do |pref|
      prefixes << pref
      add_breadcrumb pref,
                     bucket_prefix_path(prefix_id: prefixes.join('/') + '/')
    end
  end

  def safe_prefix
    CGI.unescape(prefix_id.to_s)
  end

  def bucket_id
    params[:bucket_id]
  end

  def prefix_id
    params[:prefix_id]
  end
end
