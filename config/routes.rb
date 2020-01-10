Rails.application.routes.draw do
  resources :lives, only: :index
  resources :lives, as: :live, except: :index

  root 'lives#index'


  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # devise_for :users, controllers: {
  #   confirmations: 'users/confirmations',
  #   passwords:     'users/passwords',
  #   registrations: 'users/registrations',
  #   sessions:      'users/sessions',
  # }
end