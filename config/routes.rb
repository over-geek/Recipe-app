Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  root to: "home#index"
  resources :recipes 
  resources :foods

  get 'general_list', to: 'general_list#index'
end
