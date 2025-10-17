Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'

  # resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] 2回目の修正：コメント投稿機能
  resources :prototypes do
    resources :comments, only: [:create]
  end

  resources :users, only: [:show]
end
