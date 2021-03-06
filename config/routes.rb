Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
    authenticated :user do
      root 'tasks#show', as: :authenticated_root
      resources :tasks, only: [:create, :destroy]
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users, only: [:show]

  #API Routing
  namespace :api, defaults: { format: :json } do
    resources :tasks, only: [:index, :show, :update, :create, :destroy]
    resources :users
  end

  get 'api' => 'api/users#index'


end
