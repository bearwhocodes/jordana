Rails.application.routes.draw do
  # Bootsy
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  
  # Devise
  devise_for :users

  # Application routes
  resources :notes

  # Home route
  root 'notes#index'
end
