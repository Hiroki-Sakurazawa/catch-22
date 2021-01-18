Rails.application.routes.draw do
  devise_for :users
  root to: 'pictures#index'
  resources :pictures do
    resources :comments, only: :create
    collection do
      get 'search'
      get 'bizarre'
      get 'alien'
      get 'uma'
      get 'myth'
      get 'ruin'
    end
  end
  resources :users, only: :show
end
