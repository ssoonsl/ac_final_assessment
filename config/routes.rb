Rails.application.routes.draw do
  devise_for :users

  resources :notes, only: [:index]

  resources :listusers, only: [:index]

  root 'notes#index'
end
