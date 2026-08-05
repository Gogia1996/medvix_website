Rails.application.routes.draw do
  root "pages#home"

  resources :products, only: [:show, :index]
  resources :inquiries, only: [:create]
end
