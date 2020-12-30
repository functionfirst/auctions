Rails.application.routes.draw do
  root 'auctions#index'

  resources :auctions do
    resources :bids
  end

  namespace :admin do
    resources :auctions do
      member do
        delete :delete_image_attachment
      end
    end
  end
end
