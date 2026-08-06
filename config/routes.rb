Rails.application.routes.draw do
  devise_for :admins
  root "pages#home"

  resources :products, only: [:show, :index]
  resources :inquiries, only: [:create]

  namespace :admin do
    get "dashboard/index"
    root "dashboard#index"

    resources :products
    resources :inquiries, only: [:index, :show, :destroy]
  end
end
