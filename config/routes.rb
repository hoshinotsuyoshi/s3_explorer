Rails.application.routes.draw do
  resources :buckets, only: [:show, :index] do
    resources :prefixes, only: [:show, :index]
  end
end
