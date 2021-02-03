Rails.application.routes.draw do
  root to: 'static#home'
  
  resources :chores
  resources :rooms do
    resources :chores, only: [:new, :create, :index]
  end




end
