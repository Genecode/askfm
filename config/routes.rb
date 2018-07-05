Rails.application.routes.draw do


  root 'users#index'

  resources :users
  resources :questions, except: [:show, :new, :index]
  resource :sessions, only: [:new, :create, :destroy]
end
