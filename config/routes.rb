# frozen_string_literal: true
Rails.application.routes.draw do
  resources :buckets, only: [:show, :index], id: %r{[^/]+}
end
