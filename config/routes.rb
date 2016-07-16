# frozen_string_literal: true
Rails.application.routes.draw do
  root to: 'top#show'
  resources :buckets, only: [:show, :index], id: %r{[^/]+} do
    get 'prefix/:prefix_id', to: 'prefix#show', as: :prefix
    post 'prefix/:prefix_id/presigned_url/create',
         to: 'presigned_url#create'
    get 'prefix/', to: 'prefix#show'
  end
end
