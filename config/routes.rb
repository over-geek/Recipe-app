Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  root to: "home#index"
  resources :recipes 
  resources :foods
end
