Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:show, :edit, :update, :destroy] do
    get :favorites, on: :collection
  end
  resources :items do
    resources :comments,  only: [:create]
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end
