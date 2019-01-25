Rails.application.routes.draw do
  root "static_pages#home"
  resources :suggests
  resources :products
  resources :orders
  resources :order_details, only: [:show]
  resource :cart
  devise_for :users
  resources :users, :only => [:show]
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
    get "signup" => "devise/registrations#new"
  end
  namespace :admin do
    root "static_pages#index"
    resources :categories
    resources :products
    resources :suggests, only: %i(index destroy update)
  end
end
