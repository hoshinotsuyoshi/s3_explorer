# frozen_string_literal: true
describe 'the signin process', type: :feature do
  it "html includes content 'List'" do
    visit '/buckets'
    expect(page).to have_content 'List'
  end
end
