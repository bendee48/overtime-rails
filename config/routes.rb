Rails.application.routes.draw do
  root 'static#homepage'
  resources :audit_logs, only: [:show, :index] do
    get 'confirm', on: :member
  end

  resources :posts do
    get 'approve', on: :member
  end
  devise_for :users, skip: [:registrations]
  
  namespace :admin do
    resources :users
    resources :admin_users
    resources :posts

    root to: "users#index"
  end
end
