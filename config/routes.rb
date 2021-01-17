Rails.application.routes.draw do
  root to: 'recruitments#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users do
    resources :desks
  end
  resources :myteams
  resources :recruitments, only: [:index]
  resources :friends
  resources :parties
  resources :teams
  resources :scouts
end
