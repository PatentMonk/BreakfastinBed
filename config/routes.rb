Rails.application.routes.draw do
  # BROWSER
  resources :payments
  resources :credit_cards, except: [:index]
  resources :orders
  resources :schedules
  resources :restaurant_food_items
  resources :order_food_items
  resources :restaurants
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'restaurants#index'

  # API
  scope module: :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :restaurants do
        resources :restaurant_food_items
      end

      resources :orders do
        resources :order_food_items
      end
      resources :descriptions, only: [:create, :update, :show, :destroy]
      resources :users, only: [:create, :show]
      post 'auth/login', to: 'authentication#authenticate'
    end
  end
end
