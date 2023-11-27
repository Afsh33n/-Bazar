Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "about", to: "pages#about"
  get "categories", to: "categories#index"

#category routes
  get "categories", to: "categories#index"
  get "categories/new", to: "categories#new"
  post "categories", to: "categories#create"
  get "categories/:id", to: "categories#show", as: :category
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#article routes
  get "articles", to: "articles#index"
  get "articles/new", to: "articles#new"
  post "articles", to: "articles#create"
  get "articles/:id", to: "articles#show", as: :article
  get "articles/:id/edit", to: "articles#edit"
  patch "articles/:id", to: "articles#update"
  delete "articles/:id", to: "articles#destroy"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
