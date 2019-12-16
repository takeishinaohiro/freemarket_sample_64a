Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  get  '/auth/:provider/callback', to: "items#new"
  root 'items#index'


  resources :card, only: [:new, :show, :create, :edit] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#destroy'
    end
  end
  resources :purchase, only: [:index] do
    collection do
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
    member do
      get 'index', to: 'purchase#index'
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
      post 'buy_create'
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
