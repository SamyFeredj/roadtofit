Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :posts do
    resources :likes, only: [:update]
    resources :commentaires, only: [:new, :create]
  end

  resources :recettes, only: [:index, :show, :new, :create]

  resources :choix_recettes
  # , except: [:show]
end
