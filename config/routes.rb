Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :posts
  resources :recettes, only: [:index, :show, :new, :create]
end
