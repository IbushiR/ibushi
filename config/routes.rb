Rails.application.routes.draw do

  devise_for :users

  resources :users
  resources :profiles
  resources :tweets do
    resources :comments
  end
  root 'application#root'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
