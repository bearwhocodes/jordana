Rails.application.routes.draw do
  # Bootsy
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  
  # Devise
  devise_for :users

  # Application routes
  resources :pages, only: [:show, :update]
  resources :notes
  resources :enquiries, only: [:index, :new, :create, :destroy, :show]

  # Page routes
  get 'home', to: 'pages#show', id: 'home', as: :home
  get 'about', to: 'pages#show', id: 'about', as: :about
  get 'contact', to: 'enquiries#new'

  # Home route
  root 'pages#show', id: 'home'
end
