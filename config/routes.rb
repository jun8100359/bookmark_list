Rails.application.routes.draw do
  devise_for :users
  get 'lists/index'
  root to: "lists#index"
  resources :lists, only: [:new, :create]
end
