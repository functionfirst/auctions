Rails.application.routes.draw do
  devise_for :users

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  root 'auctions#index'

  resources :auctions do
    resources :bids
  end

  resources :watchlist

  namespace :admin do
    resources :auctions do
      member do
        delete :delete_image_attachment
      end
    end
  end
end
