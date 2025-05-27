Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # API routes
  namespace :api do
    namespace :v1 do
      # Auth routes
      post '/login', to: 'auth#login'
      post '/signup', to: 'auth#signup'
      delete '/logout', to: 'auth#logout'
      get '/me', to: 'auth#me'
      
      # Resource routes
      resources :users
      resources :budgets
      resources :expenses
      resources :categories
      resources :expense_categories
      
      # Nested routes
      resources :users do
        resources :expenses, only: [:index]
      end
      
      resources :budgets do
        resources :expenses, only: [:index]
      end
      
      resources :expenses do
        resources :expense_categories, only: [:index]
      end
      
      resources :categories do
        resources :expense_categories, only: [:index]
      end
    end
  end
end
