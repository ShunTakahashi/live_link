Rails.application.routes.draw do
  resources :lives, only: :index
  resources :lives, as: :live, except: :index

  root 'lives#index'


  get 'relationships/create'
  get 'relationships/destroy'
  # devise_for :users
  # devise_for :bands
  # 
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :bands, controllers: {
    sessions:      'bands/sessions',
    passwords:     'bands/passwords',
    registrations: 'bands/registrations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
  end


end