Rails.application.routes.draw do
  get 'stress_test/cpu'
  get 'stress_test/ram'
  resources :master_ids #, only: [:index, :show, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
