Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  Rails.application.routes.draw do
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


end
