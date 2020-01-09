Rails.application.routes.draw do
  resources :lives, only: :index
  resources :lives, as: :live, except: :index

  root 'lives#index'

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }
end
