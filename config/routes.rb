Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :notes, except: [:show] do
    member do
      resources :likes, only: [:create, :destroy]
    end
  end

  resources :listusers, only: [:index] do
    member do
      resources :followings, only: [:create]
    end
  end

  resources :followings, only: [:destroy]

  root 'notes#index'
end
