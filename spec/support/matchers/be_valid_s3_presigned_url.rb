RSpec::Matchers.define :be_valid_s3_presigned_url do |path:|
  match do |actual|
    %r{\Ahttps?://}.match(actual) && \
      URI(actual).path == path && \
      actual.include?('X-Amz-Signature=')
  end
end
