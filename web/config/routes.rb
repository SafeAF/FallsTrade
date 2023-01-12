Rails.application.routes.draw do
  resources :listings
  #devise_for :users
  root 'home#index'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  ## Controllers for devise
  Rails.application.routes.draw do
     devise_for :users, controllers: {
       sessions: 'users/sessions',
       registrations: 'users/registrations'
     }
   end


  # Defines the root path route ("/")
  # root "articles#index"
end
