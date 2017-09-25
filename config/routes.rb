Rails.application.routes.draw do
  # CKeditor
  mount Ckeditor::Engine => '/ckeditor'

  # Devise
  devise_for :users

  # Application routes
  resources :notes

  # Home route
  root 'notes#index'
end
