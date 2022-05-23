Rails.application.routes.draw do
  resources :users, only: [:index. :create, :new, :show] do
    get 'login', on: :collection
    reource :loyalties, only: [:index, :create, :new, :edit]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#login"
end
