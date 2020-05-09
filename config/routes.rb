# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'dinners#index'
  get 'about', to: 'static_pages#about'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'dinners/all', to: 'dinners#all'
  resources :dinners do
    member do
      post 'love', to: 'dinners#toggle_love'
    end
  end

  get 'tags', to: 'tags#new'
  post 'tags', to: 'tags#create'

  resources :meal_plans, only: %i[create show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
