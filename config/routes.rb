Ohgre::Application.routes.draw do
  
  resources :roles

  get "communities/new"

  root :to => "users#new"
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  
  resources :communities do
      member do
      get "invite"
    end
  end
  
  resources :users do
    resources :communities
  end

  resources :communities do
    resources :users
  end
  
  resources :sessions
  
end
