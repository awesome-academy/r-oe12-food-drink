Rails.application.routes.draw do
  root "static_pages#home"
  resources :suggests
  resources :products
  resources :orders do
    resources :order_details
  end
  resource :cart
  get "/search", to: "filters#show"
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
    resources :orders, only: %i(index update) do
      resources :order_details, only: :index
    end
    resources :users, only: %i(index destroy)
  end
end
