Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :find_items, only: [:show, :index]
      resources :random_items, only: [:show]
      resources :items, only: [:show, :index]
      resources :find_merchants, only: [:show, :index]
      resources :random_merchants, only: [:show]
      resources :merchants, only: [:show, :index]
      resources :find_customers, only: [:show, :index]
      resources :random_customers, only: [:show]
      resources :customers, only: [:show, :index]
    end
  end
end
