Rails.application.routes.draw do
  root to: "portfolios#index"
  devise_for :users
  resources :portfolios
end
