# frozen_string_literal: true

RSpec::Matchers.define :be_valid_s3_presigned_url do |path:|
  match do |actual|
    %r{\Ahttps?://}.match(actual) && \
      URI(actual).path == path && \
      actual.include?('X-Amz-Signature=')
  end
end

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
      expect(assigns(:presigned_url))
        .to be_valid_s3_presigned_url(path: '/my-bucket/my-folder/my-file')
    end
  end
end
