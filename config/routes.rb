Rails.application.routes.draw do

  get 'bands/show'
  root 'lives#index'
  get 'relationships/create'
  get 'relationships/destroy'
  resources :lives, only: :index
  resources :lives, as: :live, except: :index

  resources :going_to_lives, only: :create
  resources :going_to_lives, as: :going_to_live, only: :destroy


  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }
  resources :users, only: :show

  devise_scope :band do
    get '/bands/sign_out' => 'bands/sessions#destroy'
  end
  devise_for :bands, controllers: {
    sessions: 'bands/sessions',
    passwords: 'bands/passwords',
    registrations: 'bands/registrations'
  }
  resources :bands, only: :show

  resources :live_houses, only: :show
  devise_scope :live_house do
    get '/live_houses/sign_out' => 'live_houses/sessions#destroy'
  end
  devise_for :live_houses, controllers: {
    sessions: 'live_houses/sessions',
    passwords: 'live_houses/passwords',
    registrations: 'live_houses/registrations'
  }







end