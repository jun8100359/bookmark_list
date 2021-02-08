Rails.application.routes.draw do
  get 'lists/index'
  root to: "lists#index"
end
