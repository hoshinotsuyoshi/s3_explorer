# frozen_string_literal: true
describe 'main process', type: :feature, js: true do
  it "html includes content 'Listing buckets' and 'my-bucket'" do
    Aws.config[:s3] = {
      stub_responses: {
        list_buckets: { buckets: [{ name: 'my-bucket' }] }
      }
    }
    visit '/buckets'
    expect(page).to have_content 'Listing buckets'
    expect(page).to have_content 'my-bucket'
  end
end
