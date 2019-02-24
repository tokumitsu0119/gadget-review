Rails.application.routes.draw do
  root to: 'items#index'

  resources :items do
    member do
      patch "like"
    end
  end
end
