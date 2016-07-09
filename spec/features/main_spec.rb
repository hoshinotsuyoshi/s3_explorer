# frozen_string_literal: true
describe 'main process', type: :feature, js: true do
  before do
    create_s3_content(bucket: 'my-bucket', key: 'my-folder/my-file')
  end

  it "html includes content 'Listing buckets' and 'my-bucket'" do
    visit '/buckets'
    expect(page).to have_content 'Listing buckets'
    expect(page).to have_content 'my-bucket'

    click_on 'my-bucket'

    click_on 'Back'
  end
end
