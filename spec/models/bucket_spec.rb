# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Bucket, type: :model do
  it_behaves_like 'overridden equalness', method: :name
end
