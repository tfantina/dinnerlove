Rails.application.routes.draw do
  root to: "dinners#index"
  devise_for :users
  resources :dinners do
    member do
      post 'love'
      delete 'love'
    end
  end
  resources :meal_plans, only: [:create, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
