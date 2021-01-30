Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: [:new, :update, :edit, :create, :show]
  root "items#index"
  resources :items do
    resources :comments, only: [:create]
  end
end
