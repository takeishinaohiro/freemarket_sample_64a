Rails.application.routes.draw do
  
  root 'users#index'

  resources :items do
    collection do
      get 'sell'
    end
  end
end
