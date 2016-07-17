# frozen_string_literal: true
Rails.application.routes.draw do
  root to: 'top#show'
  resources :buckets, only: [:show, :index], id: %r{[^/]+} do
    get 'prefix/:prefix_id', to: 'prefix#show', as: :prefix
    post 'prefix/:prefix_id/presigned_url/create', constraints: { prefix_id: /[^\/]+/ },
                                                   to: 'presigned_url#create', as: :presigned_url_create
    get 'prefix/', to: 'prefix#show'
  end
end
