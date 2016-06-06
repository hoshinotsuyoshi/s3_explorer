require 'rails_helper'

RSpec.describe BucketsController, type: :controller do
  let(:valid_attributes) {
    {name: 'my-bucket'}
  }

  let(:invalid_attributes) {
    {name: ''}
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all buckets as @buckets" do
      Aws.config[:s3] = {
        stub_responses: {
          list_buckets: { buckets: [{name: 'my-bucket' }] }
        }
      }
      bucket = Bucket.new valid_attributes
      get :index, {}, valid_session
      expect(assigns(:buckets)).to eq([bucket])
    end
  end

  describe "GET show" do
    it "assigns the requested bucket as @bucket" do
      Aws.config[:s3] = {
        stub_responses: {
          list_buckets: { buckets: [{name: 'my-bucket' }] }
        }
      }
      bucket = Bucket.new valid_attributes
      get :show, {id: bucket.to_param}, valid_session
      expect(assigns(:bucket)).to eq(bucket)
    end
  end
end
