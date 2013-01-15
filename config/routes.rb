Ohgre::Application.routes.draw do
  
  resources :roles
  resources :invites
  resources :admin, :only => :index
  resources :home, :only => :index

  get "communities/new"

  root :to => "users#new"
  
  get "admin" => "admin#index", :as => "admin"
  get "home" => "home#index", :as => "home"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "sign_up" => "users#new", :as => "sign_up"
  
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
