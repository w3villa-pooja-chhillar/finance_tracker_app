Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'search_stock' , to: 'stocks#search'
  get 'my_portfolio', to: 'users#my_portfolio'
  get "*path", to: "users#noroute", constraints: lambda { |req| req.path.exclude? "rails/active_storage" }
end
