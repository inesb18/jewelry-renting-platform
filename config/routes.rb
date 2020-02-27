Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :product_reviews, only: [:create]
    resources :rentals, only: [:new,:create]
  end
  resources :users, only: [] do
    resources :renter_reviews, only: [:create]
  end
  namespace :owner do
    resources :rentals, only: [:index, :show]
    resources :products, only: [:index]
  end
  namespace :renter do
    resources :rentals, only: [:index, :show]
  end
end
