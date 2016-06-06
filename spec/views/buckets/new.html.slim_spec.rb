require 'rails_helper'

RSpec.describe "buckets/new", type: :view do
  before(:each) do
    assign(:bucket, Bucket.new())
  end

  it "renders new bucket form" do
    render

    assert_select "form[action=?][method=?]", buckets_path, "post" do
    end
  end
end
