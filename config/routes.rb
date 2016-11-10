Rails.application.routes.draw do
  root :to => "pages#home"

  resources :companies
  resources :locations
  resources :technologies, :only => [:show]
  resources :users do
    get :confirm_email, on: :member
  end
  resources :profiles
  get "/pages/:page" => "pages#show"

  get 'cities/:state', to: 'application#cities'
  # resources :sessions, :as => "log_in", :only => [:new, :create]
  # resources :sessions, :only => [:new, :create]
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get '/log-out' => 'sessions#destroy', as: :log_out
end 
#
# 1. GET /states/:id => { state: "OR", cities: [ ... ] }
# 2. GET /cities?state=OR => [...]
