Rails.application.routes.draw do
  root to: 'recruitments#index'
  devise_for :users
  resources :users do
    resources :desks
  end
  resources :myteams
  resources :recruitments, only: [:index]
  resources :friends
  resources :parties
  resources :scouts
end
