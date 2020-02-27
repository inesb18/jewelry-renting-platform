Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products do
    resources :product_reviews, only: [:create]
    resources :rentals, only: [:new,:create]
  end
  resources :users, only: [:edit, :update] do
    resources :renter_reviews, only: [:create]
  end
  namespace :owner do
    resources :rentals, only: [:index]  do
      get 'confirm', to: 'rentals#confirm', as: 'confirm'
      get 'decline', to: 'rentals#decline', as: 'decline'
    end
    resources :products, only: [:index]
  end
  namespace :renter do
    resources :rentals, only: [:index]
  end
end
