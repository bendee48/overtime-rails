Rails.application.routes.draw do
  root 'static#homepage'
  resources :audit_logs, only: [:show, :index]
  resources :posts
  devise_for :users, skip: [:registrations]
  
  namespace :admin do
      resources :users
      resources :admin_users
      resources :posts

      root to: "users#index"
    end
end
