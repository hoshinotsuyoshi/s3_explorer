# frozen_string_literal: true

RSpec.describe TopController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/').to route_to(
        controller: 'top',
        action: 'show'
      )
    end
  end
end
