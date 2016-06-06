require 'rails_helper'

RSpec.describe "buckets/index", type: :view do
  before(:each) do
    assign(:buckets, [
      Bucket.create!(),
      Bucket.create!()
    ])
  end

  it "renders a list of buckets" do
    render
  end
end
