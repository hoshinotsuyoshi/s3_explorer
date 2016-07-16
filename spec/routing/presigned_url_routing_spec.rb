# frozen_string_literal: true

RSpec.describe PresignedUrlController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/buckets/my-bucket/prefix/my-file/presigned_url/create')
        .to route_to(
          controller: 'presigned_url',
          action: 'create',
          bucket_id: 'my-bucket',
          prefix_id: 'my-file'
        )
    end
  end
end
