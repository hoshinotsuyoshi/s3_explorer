# frozen_string_literal: true

RSpec.describe PresignedUrlController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/buckets/my-bucket/file/my-file/presigned_url')
        .to route_to(
          controller: 'presigned_url',
          action: 'create',
          bucket_id: 'my-bucket',
          file_id: 'my-file'
        )
    end
  end
end
