# frozen_string_literal: true

RSpec.describe S3Object::File, type: :model do
  describe '.select' do
    before do
      create_s3_content(bucket: 'my-bucket', key: 'my-folder/my-file')
    end

    it 'returns object list' do
      files = S3Object::File.select(bucket: 'my-bucket', prefix: 'my-folder/')
      expect(files).to eq [S3Object::File.new(key: 'my-file')]
    end
  end

  describe '#presigned_url' do
    before do
      create_s3_content(bucket: 'my-bucket', key: 'my-folder/my-file')
    end

    it 'returns presigned_url' do
      file = S3Object::File.new({ key: 'my-file' }, bucket: 'my-bucket')
      presigned_url = file.presigned_url
      expect(presigned_url).to match /\Ahttps?:\/\//
      expect(URI(presigned_url).path).to eq '/my-bucket/my-file'
      expect(presigned_url).to include 'X-Amz-Signature='
    end
  end

  describe '#key' do
    it "returns same value of #initialize's first arg" do
      file = S3Object::File.new(key: 'my-file')
      expect(file.key).to eq 'my-file'
    end
  end

  it_behaves_like 'overridden equalness', method: :key
end
