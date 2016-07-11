# frozen_string_literal: true
describe 'main process', type: :feature, js: true do
  before do
    create_s3_content(
      bucket: 'my-bucket1.com',
      key: 'my-folder1/my-folder2/my-file1'
    )
  end

  it 'click bucket, folder, back-link' do
    visit '/buckets'

    click_on 'my-bucket1.com'

    click_on 'my-folder1'

    click_on 'my-folder2'

    expect(page).to have_content 'my-file1'

    click_on 'my-folder1'

    expect(current_path).to eq('/buckets/my-bucket1.com/prefix/my-folder1%2F')

    click_on 'S3Explorer'

    sleep 0.1

    expect(current_path).to eq('/buckets')
  end
end
