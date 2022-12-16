Rails.application.routes.draw do

  devise_for :users

  resource :profiles

  resources :users

  resources :tweets, except: %i(edit update) do
    resources :favorites, only: %i(create destroy)
    resources :comments, only: %i(new create) 
  end


  root 'tweets#show'

end
