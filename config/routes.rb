Rails.application.routes.draw do
  resources :users, only: [:create, :show, :index]
  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  get "/user_is_authed", to: "auth#user_is_authed"
  post '/authlogin', to: 'plaid#authlogin'
  post '/transactions', to: 'plaid#transactions'
  
  
  
  resources :entities
  resources :expenses, only: [:index, :create, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
