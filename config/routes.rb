Rails.application.routes.draw do

  root "items#index"

  get "/sell", to: 'items#sell', as: 'sell'
end
