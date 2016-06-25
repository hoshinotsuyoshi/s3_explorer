# frozen_string_literal: true
Rails.application.routes.draw do
  resources :buckets, only: [:show, :index] do
    resources :s3_objects, only: [:show, :index]
  end
end
