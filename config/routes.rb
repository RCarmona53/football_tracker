Rails.application.routes.draw do
  devise_for :users
  resources :players do
    resources :stats, only: [:new, :create, :edit, :update, :index]
  end
  resources :matches do
    resources :stats, only: [:new, :create]
  end
  root to: "main#index"
end
