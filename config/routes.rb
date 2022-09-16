Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :items do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
end
