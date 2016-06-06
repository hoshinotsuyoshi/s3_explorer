require 'rails_helper'

RSpec.describe "buckets/show", type: :view do
  before(:each) do
    @bucket = assign(:bucket, Bucket.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
