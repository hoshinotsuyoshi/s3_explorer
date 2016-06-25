# frozen_string_literal: true

RSpec.describe Bucket, type: :model do
  it_behaves_like 'overridden equalness', method: :name
end
