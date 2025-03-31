Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard", as: :dashboard
  get "profile", to: "pages#profile", as: :profile

  resources :posts do
    resources :likes, only: [:update]
    resources :commentaires, only: [:index, :new, :create, :destroy]
  end

  resources :recettes, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]

  resources :choix_recettes
  # , except: [:show]
end
