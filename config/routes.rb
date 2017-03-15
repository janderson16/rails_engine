Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get 'find', to: "find_merchants#show"
        get 'find_all', to: "find_merchants#index"
        get 'random', to: "random_merchants#show"
      end
      resources :merchants, only: [:show, :index]

      namespace :items do
        get 'find', to: "find_items#show"
        get 'find_all', to: "find_items#index"
        get 'random', to: "random_items#show"
      end
      resources :items, only: [:show, :index]

      namespace :customers do
        get 'find', to: "find_customers#show"
        get 'find_all', to: "find_customers#index"
        get 'random', to: "random_customers#show"
      end
      resources :customers, only: [:show, :index]

      namespace :invoices do
        get 'find', to: "find_invoices#show"
        get 'find_all', to: "find_invoices#index"
        get 'random', to: "rando_invoices#show"
      end
      resources :invoices, only: [:show, :index]
    end
  end
end
