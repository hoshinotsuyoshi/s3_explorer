# frozen_string_literal: true
Rails.application.routes.draw do
  resources :buckets, only: [:show, :index], id: %r{[^/]+} do
    get ':prefix_id', prefix_id: /[\s\S]+/, to: 'buckets#show'
  end
end
