Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only:[:index, :destroy, :create, :edit, :show]
  resources :cards, only:[:show]
  resources :items do
    collection do
      get 'sell'
    end
    member do
      get 'buy'
    end
  end
end
