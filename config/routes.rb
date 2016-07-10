# frozen_string_literal: true
Rails.application.routes.draw do
  resources :buckets, only: [:show, :index], id: %r{[^/]+} do
    get 'prefix/:prefix_id', prefix_id: /.*/, to: 'prefix#show', as: :prefix
    get 'prefix/', to: 'prefix#show'
  end
end
