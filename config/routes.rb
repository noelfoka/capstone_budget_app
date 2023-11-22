Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root "categories#index", as: :authenticated_root
  end
  root "welcome#index"
  resources :categories, only: [:index, :new, :show, :create]
  resources :expenses, only: [:new, :create]
end