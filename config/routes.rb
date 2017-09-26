Rails.application.routes.draw do
  # Devise
  devise_for :users

  # Application routes
  resources :notes

  # Home route
  root 'notes#index'
end
