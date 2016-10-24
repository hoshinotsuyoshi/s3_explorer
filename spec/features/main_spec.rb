# frozen_string_literal: true

SMALL_WAIT  = 0.1
MEDIUM_WAIT = ENV['CI'] ? 2.0 : 1.0

describe 'main process', type: :feature, js: true do
  before do
    create_s3_content(
      bucket: 'my-bucket',
      key: 'my-folder1/my-folder2/my-file1'
    )
  end

  it 'click bucket, folder, back-link' do
    visit '/buckets'

    within('table') do
      click_on 'my-bucket'
    end

    click_on 'my-folder1'

    click_on 'my-folder2'

    expect(page).to have_content 'my-file1'

    expect(page).not_to have_content 'Pre-Signed'

    find('span.glyphicon.glyphicon-paperclip').click

    sleep SMALL_WAIT

    expect(page).to have_content 'Get shareable link'

    within('a.fetch-url') do
      click_on 'Get'
    end

    sleep MEDIUM_WAIT

    fetched_url = find('input.url').value
    expect(fetched_url).to be_start_with('http://127.0.0.1')
    expect(URI(fetched_url).path)
      .to eq('/my-bucket/my-folder1/my-folder2/my-file1')

    click_on 'Close'

    click_on 'my-folder1'

    expect(current_path).to eq('/buckets/my-bucket/prefix/my-folder1%2F')

    click_on 'S3 Explorer'

    sleep MEDIUM_WAIT

    expect(current_path).to eq('/buckets')
  end
end
