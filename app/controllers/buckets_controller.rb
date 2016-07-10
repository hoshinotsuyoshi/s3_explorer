# frozen_string_literal: true
class BucketsController < ApplicationController
  # GET /buckets
  # GET /buckets.json
  def index
    @buckets = Bucket.all
  end

  # GET /buckets/1
  # GET /buckets/1.json
  def show
    redirect_to(bucket_prefix_path(bucket_id: params[:id], prefix_id: ''))
  end
end
