Rails.application.routes.draw do
  # Bootsy
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  
  # Devise
  devise_for :users

  # Application routes
  resources :notes
  resources :enquiries, only: [:index, :new, :create, :destroy, :show]

  # Home route
  root 'notes#index'
end
