# frozen_string_literal: true
require 'rails_helper'

RSpec.describe BucketsController, type: :controller do
  let(:valid_attributes) do
    { name: 'my-bucket' }
  end

  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all buckets as @buckets' do
      Aws.config[:s3] = {
        stub_responses: {
          list_buckets: { buckets: [{ name: 'my-bucket' }] }
        }
      }
      bucket = Bucket.new valid_attributes
      get :index, params: valid_attributes, session: valid_session
      expect(assigns(:buckets)).to eq([bucket])
    end
  end

  describe 'GET show' do
    it 'assigns the requested bucket as @bucket' do
      Aws.config[:s3] = {
        stub_responses: {
          list_buckets: { buckets: [{ name: 'my-bucket' }] }
        }
      }
      bucket = Bucket.new valid_attributes
      get :show, params: { id: bucket.to_param }, session: valid_session
      expect(assigns(:bucket)).to eq(bucket)
    end
  end
end
