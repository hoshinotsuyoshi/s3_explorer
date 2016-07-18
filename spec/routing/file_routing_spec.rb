# frozen_string_literal: true

RSpec.describe S3Object::FileController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/buckets/my-bucket/s3_object/file/my-file.foo.bar')
        .to route_to(
          controller: 's3_object/file',
          action: 'show',
          bucket_id: 'my-bucket',
          id: 'my-file.foo.bar',
          format: :json
        )
    end
  end
end
