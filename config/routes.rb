Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products, only: [:index, :new, :create, :show, :delete] do
    resources :product_reviews, only: [:create]
    resources :rentals, only: [:new,:create]
  end
  resources :users, only: [] do
    resources :rentee_reviews, only: [:create]
  end
  resources :rentals, only: :show
  namespace :renter do
    resources :rentals, only: [:index]
  end
  namespace :rentee do
    resources :rentals, only: [:index]
  end
end
