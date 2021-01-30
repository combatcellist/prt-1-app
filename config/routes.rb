Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: [:new, :update, :edit, :create, :show]
  root "items#index"
  resources :items
end
