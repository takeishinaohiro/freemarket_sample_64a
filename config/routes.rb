Rails.application.routes.draw do
  root 'items#index'

  resouces :items do
    collection
  end
end
