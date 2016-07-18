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

    within('table') do
      click_on 'my-bucket1.com'
    end

    click_on 'my-folder1'

    click_on 'my-folder2'

    expect(page).to have_content 'my-file1'

    expect(page).not_to have_content 'Pre-Signed'

    find('button.btn.btn-default.btn-xs').click

    sleep 0.1

    expect(page).to have_content 'Get shareable link'

    click_on 'Fetch'

    sleep 0.1

    fetched_url = find('input.url').value
    expect(fetched_url).to be_start_with('http://127.0.0.1')
    expect(URI(fetched_url).path)
      .to eq('/my-bucket1.com/my-folder1/my-folder2/my-file1')

    click_on 'Close'

    click_on 'my-folder1'

    expect(current_path).to eq('/buckets/my-bucket1.com/prefix/my-folder1%2F')

    click_on 'S3 Explorer'

    sleep 0.5

    expect(current_path).to eq('/buckets')
  end
end
