class BucketsController < ApplicationController
  before_action :set_bucket, only: :show

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
end
