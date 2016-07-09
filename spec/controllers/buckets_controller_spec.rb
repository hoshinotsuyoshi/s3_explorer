# frozen_string_literal: true

RSpec.describe BucketsController, type: :controller do
  let(:valid_attributes) do
    { name: 'my-bucket' }
  end

  let(:valid_session) { {} }

  before do
    s3 = Aws::S3::Client.new
    s3.create_bucket(bucket: 'my-bucket')
  end

  after { FakeS3Server.restart }

  describe 'GET index' do
    it 'assigns all buckets as @buckets' do
      bucket = Bucket.new valid_attributes
      get :index, params: valid_attributes, session: valid_session
      expect(assigns(:buckets)).to eq([bucket])
    end
  end

  describe 'GET show' do
    it 'assigns the requested bucket as @bucket' do
      bucket = Bucket.new valid_attributes
      get :show, params: { id: bucket.to_param }, session: valid_session
      expect(assigns(:bucket)).to eq(bucket)
    end
  end
end
