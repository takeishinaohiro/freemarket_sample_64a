Rails.application.routes.draw do
  # get 'card/new'
  # get 'card/show'
  devise_for :users
  root 'items#index'
  resources :users, only:[:index, :destroy, :create, :edit, :show]
  resources :card, only: [:new, :show, :create] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :items do
    collection do
      get 'sell'
    end

    member do
      get 'buy'
    end
  end

  resources :users do
    member do
      get 'todo'
      get 'past'
    end
  end
end
