Rails.application.routes.draw do
  root "pages#home"
  resources :inquiries, only: [:create]
end
