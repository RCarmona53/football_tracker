Rails.application.routes.draw do
  devise_for :users
  resources :players
  resources :matches do
    resources :stats
  end
end
