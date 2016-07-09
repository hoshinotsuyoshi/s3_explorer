# frozen_string_literal: true
module CreateS3Content
  def create_s3_content(bucket:, key:)
    FakeS3Server.restart
    s3 = Aws::S3::Client.new
    s3.create_bucket(bucket: bucket)
    Tempfile.open('file') do |file|
      file.puts 'body'
      file.flush
      s3.put_object(
        bucket: bucket, key: key, body: file
      )
    end
  end
end
