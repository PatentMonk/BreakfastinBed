Rails.application.routes.draw do

  resources :credit_cards
  resources :orders
  # BROWSER
  resources :schedules
  resources :food_items
  resources :restaurants
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'restaurants#index'

  # API
  scope module: :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :restaurants
      resources :users, only: [:create, :show]
      post 'auth/login', to: 'authentication#authenticate'
    end
  end
end
