Rails.application.routes.draw do
  get 'health/check'

  namespace :api do
    namespace :v1 do
      resources :todos, only: [:index, :create, :show, :update, :destroy]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
