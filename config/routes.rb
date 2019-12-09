Rails.application.routes.draw do
  root "items#index"

  resources :items do
    collection do
      get 'sell'
    end
  end

  resources :users do
    collection do
      get 'adress'
    end
  end

end
