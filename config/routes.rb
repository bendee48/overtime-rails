Rails.application.routes.draw do
  root 'static#homepage'
  devise_for :users, skip: [:registrations]

  resources :audit_logs, only: [:show, :index] do
    get 'confirm', on: :member
  end

  resources :posts do
    get 'approve', on: :member
  end

  namespace :admin do
    resources :users
    resources :admin_users
    resources :employees
    resources :posts

    root to: "users#index"
  end
end
