# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PrefixesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/buckets/1/prefixes').to \
        route_to('prefixes#index', bucket_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/buckets/1/prefixes/1').to \
        route_to('prefixes#show', id: '1', bucket_id: '1')
    end
  end
end
