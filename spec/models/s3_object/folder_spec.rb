# frozen_string_literal: true

RSpec.describe S3Object::Folder, type: :model do
  describe '.select' do
    before do
      create_s3_content(bucket: 'my-bucket', key: 'my-folder/my-file')
    end

    it 'returns object list' do
      files = S3Object::Folder.select(bucket: 'my-bucket', prefix: '')
      expect(files).to eq [
        S3Object::Folder.new(double(:common_prefix, prefix: 'my-folder/'))
      ]
    end
  end

  describe '#prefix' do
    it "returns same value of #initialize's first arg" do
      folder = S3Object::Folder.new(
        double(:common_prefix, prefix: 'my-folder/')
      )
      expect(folder.prefix).to eq 'my-folder/'
    end
  end
end
