Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  
  resources :card, only: [:new, :show, :create, :edit] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#destroy'
    end
  end

  resources :items do
    resources :images do
    end
    collection do
      get 'sell'
    end

    member do
      get 'buy'
    end
  end

  resources :users,only:[:index, :destroy, :create, :edit, :show] do
    collection do
      get 'result'
    end

    member do
      get 'todo'
      get 'past'
    end
  end
end
