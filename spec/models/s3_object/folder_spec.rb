# frozen_string_literal: true

RSpec.describe S3Object::Folder, type: :model do
  describe '.select' do
    before do
      FakeS3Server.restart
      s3 = Aws::S3::Client.new
      s3.create_bucket(bucket: 'my-bucket')
      Tempfile.open('file') do |file|
        file.puts 'body'
        file.flush
        s3.put_object(
          bucket: 'my-bucket',
          key: 'my-folder/my-file',
          body: file
        )
      end
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
