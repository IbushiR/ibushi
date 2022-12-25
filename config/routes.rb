Rails.application.routes.draw do

  devise_for :users

  resource :profiles

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :tweets, except: %i(edit update) do
    resources :favorites, only: %i(create destroy)
    resources :comments, only: %i(new create) 
  end

  get 'search' => 'tweets#search'

end
