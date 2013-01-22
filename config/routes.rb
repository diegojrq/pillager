Pillager::Application.routes.draw do
  
  resources :roles
  resources :invites

  get "admin" => "admin#index", :as => "admin"
  get "home" => "home#home", :as => "home"
  get "main" => "home#main", :as => "main"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  root :to => "home#home"
  
  namespace :admin do
    resources :users
    resources :communities
    resources :roles
  end
  
  resources :users, :except => :index do
    resources :invites
    resources :communities
  end
  
  resources :communities do
    resources :users
    resources :invites
  end
  
  resources :sessions
  
end
