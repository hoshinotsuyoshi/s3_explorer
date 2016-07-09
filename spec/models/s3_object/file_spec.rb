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

  describe '#key' do
    it "returns same value of #initialize's first arg" do
      file = S3Object::File.new(key: 'my-file')
      expect(file.key).to eq 'my-file'
    end
  end

  it_behaves_like 'overridden equalness', method: :key
end
