Rails.application.routes.draw do
  root :to => "pages#home"

  resources :companies
  resources :locations
  resources :technologies, :only => [:show]
  resources :users do
    member do
      get :confirm_email
    end
  end
  resources :profiles
  get "/pages/:page" => "pages#show"

  # resources :sessions, :as => "log_in", :only => [:new, :create]
  # resources :sessions, :only => [:new, :create]
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get '/log-out' => 'sessions#destroy', as: :log_out
end
