# frozen_string_literal: true
RSpec.describe S3Object::File, type: :model do
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
          key: 'my-file',
          body: file
        )
      end
    end

    it 'returns object list' do
      files = S3Object::File.select(bucket: 'my-bucket', prefix: '')
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
