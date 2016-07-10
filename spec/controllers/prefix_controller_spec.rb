# frozen_string_literal: true

RSpec.describe PrefixController, type: :controller do
  let(:valid_session) { {} }

  before do
    create_s3_content(bucket: 'my-bucket', key: 'my-folder/my-file')
  end

  describe 'GET show' do
    it 'assigns the requested bucket as @bucket, files as @files' do
      bucket = Bucket.new(name: 'my-bucket')
      file   = S3Object::File.new(key: 'my-folder/my-file')
      get :show,
          params: { bucket_id: 'my-bucket', prefix_id: 'my-folder/' },
          session: valid_session
      expect(assigns(:bucket)).to eq(bucket)
      expect(assigns(:files)).to eq([file])
      expect(assigns(:folders)).to be_empty
    end
  end
end
