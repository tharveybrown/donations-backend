Rails.application.routes.draw do
  resources :entities
  resources :expenses
  resources :users
  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
