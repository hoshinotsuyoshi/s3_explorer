# frozen_string_literal: true
RSpec.describe S3Object::File, type: :model do
  describe '.select' do
    it 'returns object list' do
      Aws.config[:s3] = {
        stub_responses: {
          list_objects_v2: { contents: [{ key: 'my-file' }] }
        }
      }
      files = S3Object::File.select(bucket: 'test', prefix: '')
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
