Rails.application.routes.draw do
  root to: 'recruitments#index'
  devise_for :users
  resources :recruitments, only: [:index]
end
