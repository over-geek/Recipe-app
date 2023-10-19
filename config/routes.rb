Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  root to: "home#index"
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    member do
      patch 'toggle'
    end
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy] do
      get :new_food, on: :member
    end
  end
  resources :foods

  resources :recipes do
    member do
      get 'show_for_purpose1'
    end
  end
  

  get 'general_list', to: 'general_list#index'
end
