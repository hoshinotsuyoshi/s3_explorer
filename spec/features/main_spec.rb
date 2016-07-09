# frozen_string_literal: true
describe 'main process', type: :feature, js: true do
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

  it "html includes content 'Listing buckets' and 'my-bucket'" do
    visit '/buckets'
    expect(page).to have_content 'Listing buckets'
    expect(page).to have_content 'my-bucket'

    click_on 'my-bucket'

    click_on 'Back'
  end
end
