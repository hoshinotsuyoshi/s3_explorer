# frozen_string_literal: true

RSpec.describe PrefixController, type: :routing do
  describe 'routing' do
    context 'prefix contained' do
      it 'routes to #show' do
        expect(get: '/buckets/my-bucket/prefix/my-folder1%2Fmy-folder2')
          .to route_to(
            controller: 'prefix',
            action: 'show',
            bucket_id: 'my-bucket',
            prefix_id: 'my-folder1/my-folder2'
          )
      end
    end

    context 'ends_with "prefix/"' do
      it 'routes to #show' do
        expect(get: '/buckets/my-bucket/prefix/')
          .to route_to(
            controller: 'prefix',
            action: 'show',
            bucket_id: 'my-bucket'
          )
      end
    end
  end
end
