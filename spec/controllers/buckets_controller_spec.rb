# frozen_string_literal: true

RSpec.describe BucketsController, type: :controller do
  let(:valid_attributes) do
    { name: 'my-bucket' }
  end

  let(:valid_session) { {} }

  before do
    create_s3_content(bucket: 'my-bucket', key: 'my-folder/my-file')
  end

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
