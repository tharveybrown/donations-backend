Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  post '/authlogin', to: 'plaid#authlogin'
  get '/transactions', to: 'plaid#transactions'
  
  resources :users, only: [:create, :show, :index]
  
  resources :entities
  resources :expenses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
