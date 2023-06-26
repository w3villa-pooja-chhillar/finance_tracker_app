Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'search_stock' , to: 'stocks#search'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friends' , to: 'users#my_friends'
  get 'search_friend', to:'users#search'
  get 'friendships', to: 'friendships#create'
  get "*path", to: "users#noroute", constraints: lambda { |req| req.path.exclude? "rails/active_storage" }
end
