Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get 'find', to: "find_merchants#show"
        get 'find_all', to: "find_merchants#index"
        get 'random', to: "random_merchants#show"
        get 'most_revenue', to: "most_revenue#index"
        get '/:id/favorite_customer', to: "favorite_customer#show"
        get '/:id/customers_with_pending_invoices', to: "customers_with_pending_invoices#show"
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
        get 'random', to: "random_invoices#show"
        get '/:id/transactions', to: "transactions#index"
        get '/:id/invoice_items', to: "invoice_items#index"
        get '/:id/items', to: "items#index"
        get '/:id/customer', to: "customer#show"
        get '/:id/merchant', to: "merchant#show"
      end
      resources :invoices, only: [:show, :index]

      namespace :transactions do
        get 'find', to: "find_transactions#show"
        get 'find_all', to: "find_transactions#index"
        get 'random', to: "random_transactions#show"
      end
      resources :transactions, only: [:show, :index]

      namespace :invoice_items do
        get 'find', to: "find_invoice_items#show"
        get 'find_all', to: "find_invoice_items#index"
        get 'random', to: "random_invoice_items#show"
      end
      resources :invoice_items, only: [:show, :index]
    end
  end
end
