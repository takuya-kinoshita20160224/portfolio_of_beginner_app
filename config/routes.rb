Rails.application.routes.draw do
  root to: "portfolios#index"
  devise_for :users
  resources :portfolios do
    resources :comments, only: [:new, :create]
    collection do
      get :search
    end
  end
end
