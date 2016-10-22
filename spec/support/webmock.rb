# frozen_string_literal: true
require 'webmock/rspec'
WebMock.disable_net_connect!(
  allow: 'codeclimate.com',
  allow_localhost: true
)
