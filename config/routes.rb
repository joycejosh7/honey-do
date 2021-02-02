Rails.application.routes.draw do
  resources :rooms
  root to: 'static#home'
  
  resources :chores




end
