Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users
  resources :users, :only => [:show]
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
    get "signup" => "devise/registrations#new"
  end
end
