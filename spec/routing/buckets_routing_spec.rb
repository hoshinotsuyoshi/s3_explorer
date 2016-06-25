# frozen_string_literal: true

RSpec.describe BucketsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/buckets').to route_to('buckets#index')
    end

    it 'routes to #show' do
      expect(get: '/buckets/1').to route_to('buckets#show', id: '1')
    end
  end
end
