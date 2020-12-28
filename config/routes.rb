Rails.application.routes.draw do
  root 'auctions#index'

  resources :auctions

  namespace :admin do
    resources :auctions
  end
end
