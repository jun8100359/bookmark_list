Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"
  resources :lists, only: [:create, :edit, :update, :destroy] do
    resources :bookmarks, only: [:index, :create, :edit, :update, :destroy]
  end
end
