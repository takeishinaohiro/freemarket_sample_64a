Rails.application.routes.draw do
  root "items#show"

  resources :items do
    collection do
      get 'sell'
    end
  end

end
