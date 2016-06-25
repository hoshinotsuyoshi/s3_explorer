# frozen_string_literal: true
require 'rails_helper'

RSpec.describe S3ObjectsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/buckets/1/s3_objects').to \
        route_to('s3_objects#index', bucket_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/buckets/1/s3_objects/1').to \
        route_to('s3_objects#show', id: '1', bucket_id: '1')
    end
  end
end
