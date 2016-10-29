# frozen_string_literal: true

RSpec.describe S3Object::PresignedUrl, type: :model do
  describe '#to_s' do
    it 'returns presigned_url' do
      presigned_url = S3Object::PresignedUrl.new(
        instance_double(
          'S3Object::File',
          bucket: 'my-bucket',
          fullpath: 'my-folder/my-file'
        )
      )
      expect(presigned_url.to_s)
        .to be_valid_s3_presigned_url(path: '/my-bucket/my-folder/my-file')
    end
  end
end
