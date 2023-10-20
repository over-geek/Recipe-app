Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  root to: "home#index"
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    member do
      patch 'toggle'
    end
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :foods
  
  get 'public_recipes', to: 'recipes#public_recipes', as: :public_recipes

  get 'general_list', to: 'general_list#index'
end
