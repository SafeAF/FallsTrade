Rails.application.routes.draw do
  resources :offerings
  resources :service_providers
  root 'home#index'
  get 'home/index'

  Rails.application.routes.draw do
  resources :offerings
  resources :service_providers
     devise_for :users, controllers: {
       sessions: 'users/sessions',
       registrations: 'users/registrations'
     }
   end

   resources :users, only: [:show]

   resources :likes, only: :create

   resources :listings do
     resources :comments
   end

   #resources :comments

   get "/users/:id/posts", to: "listings#user", as: "users_listings"
   get "/users/:id/comments", to: "comments#user", as: "users_comments"


end
