Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :admin_users
      resources :posts

      root to: "users#index"
    end
  resources :posts
  root 'static#homepage'
  devise_for :users, skip: [:registrations]
end
