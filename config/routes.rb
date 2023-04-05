Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'contact_files#index'

  resources :contacts, only: [:index, :new, :create]
  resources :contact_files, only: [:show,:index]
end
