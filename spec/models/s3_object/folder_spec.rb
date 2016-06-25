# frozen_string_literal: true
require 'rails_helper'

RSpec.describe S3Object::Folder, type: :model do
  describe '.select' do
    it 'returns object list' do
      Aws.config[:s3] = {
        stub_responses: {
          list_objects_v2: {
            common_prefixes: [{ prefix: 'my-folder/' }]
          }
        }
      }
      files = S3Object::Folder.select(bucket: 'test', prefix: 'my-folder/')
      expect(files).to eq [
        S3Object::Folder.new(double(:common_prefix, prefix: 'my-folder/'))
      ]
    end
  end

  describe '#prefix' do
    it "returns same value of #initialize's first arg" do
      folder = S3Object::Folder.new(
        double(:common_prefix, prefix: 'my-folder/')
      )
      expect(folder.prefix).to eq 'my-folder/'
    end
  end
end
