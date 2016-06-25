# frozen_string_literal: true
class S3ObjectsController < ApplicationController
  before_action :set_s3_object, only: :show

  # GET /s3_objects
  # GET /s3_objects.json
  def index
    @s3_objects = S3Object.all
  end

  # GET /s3_objects/1
  # GET /s3_objects/1.json
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_s3_object
    @s3_object = S3Object.find(params[:id])
  end
end
