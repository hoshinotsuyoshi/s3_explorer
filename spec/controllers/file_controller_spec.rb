# frozen_string_literal: true

RSpec.describe S3Object::FileController, type: :controller do
  let(:valid_session) { {} }

  before do
    create_s3_content(bucket: 'my-bucket', key: 'my-folder/my-file')
  end

  describe 'Show' do
    it 'assigns presigned_url string as @presigned_url' do
      get :show,
           params: {
             bucket_id: 'my-bucket',
             id: 'my-folder%2Fmy-file'
           },
           format: :json,
           session: valid_session
      expect(assigns(:presigned_url))
        .to be_valid_s3_presigned_url(path: '/my-bucket/my-folder/my-file')
    end
  end
end
