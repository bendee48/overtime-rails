Rails.application.routes.draw do
  resources :posts
  root 'static#homepage'
  devise_for :users
end
