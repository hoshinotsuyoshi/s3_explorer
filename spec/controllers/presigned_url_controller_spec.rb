# frozen_string_literal: true

RSpec.describe PresignedUrlController, type: :controller do
  let(:valid_session) { {} }

  before do
    create_s3_content(bucket: 'my-bucket', key: 'my-folder/my-file')
  end

  describe 'Create' do
    it 'assigns presigned_url string as @presigned_url' do
      post :create,
           params: { bucket_id: 'my-bucket', prefix_id: 'my-folder/my-file' },
           session: valid_session
      expect(assigns(:presigned_url)).to match %r{\Ahttps?://}
      expect(URI(assigns(:presigned_url)).path).to eq '/my-bucket/my-folder/my-file'
      expect(assigns(:presigned_url)).to include 'X-Amz-Signature='
    end
  end
end
