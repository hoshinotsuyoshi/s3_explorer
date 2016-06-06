require 'rails_helper'

RSpec.describe "buckets/edit", type: :view do
  before(:each) do
    @bucket = assign(:bucket, Bucket.create!())
  end

  it "renders the edit bucket form" do
    render

    assert_select "form[action=?][method=?]", bucket_path(@bucket), "post" do
    end
  end
end
