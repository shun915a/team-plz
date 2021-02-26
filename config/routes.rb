Rails.application.routes.draw do
  root to: 'recruitments#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  resources :users do
    resources :desks
  end
  resources :myteams
  resources :recruitments, only: [:index]
  resources :friends
  resources :parties do
    resources :party_members do
      patch :accept_request
      patch :decline_request
    end
  end
  resources :teams
  resources :scouts
end
