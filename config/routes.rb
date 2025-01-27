Rails.application.routes.draw do
  devise_for :users
  resources :players do
    resources :stats, only: [:new, :create, :edit, :update, :index, :destroy]
  end
  resources :matches do
    resources :stats, only: [:new, :create, :destroy]
  end
  root to: "main#index"
end
