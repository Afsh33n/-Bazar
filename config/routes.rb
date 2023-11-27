Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "about", to: "pages#about"
  
#category routes
  get "categories", to: "categories#index"
  get "categories/new", to: "categories#new"
  post "categories", to: "categories#create"
  get "categories/:id", to: "categories#show", as: :category
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
