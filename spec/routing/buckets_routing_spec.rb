# frozen_string_literal: true

RSpec.describe BucketsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/buckets').to route_to('buckets#index')
    end

    it 'routes to #show' do
      expect(get: '/buckets/my-bucket')
        .to route_to(
          controller: 'buckets',
          action: 'show',
          id: 'my-bucket'
        )
    end

    context 'bucket id contains dot(.)' do
      it 'routes to #show' do
        expect(get: '/buckets/my-bucket.com')
          .to route_to(
            controller: 'buckets',
            action: 'show',
            id: 'my-bucket.com'
          )
      end
    end

    context 'prefix contained' do
      it 'routes to #show' do
        expect(get: '/buckets/my-bucket/prefix/my-folder1/my-folder2')
          .to route_to(
            controller: 'prefix',
            action: 'show',
            bucket_id: 'my-bucket',
            prefix_id: 'my-folder1/my-folder2'
          )
      end
    end
  end
end
