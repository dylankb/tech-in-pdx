Rails.application.routes.draw do
  root :to => "pages#home"

  resources :companies
  resources :locations

  resources :technologies, :only => [:show]

  resources :users
  get "/pages/:page" => "pages#show"

  # resources :sessions, :as => "log_in", :only => [:new, :create]
  # resources :sessions, :only => [:new, :create]
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get '/log-out' => 'sessions#destroy', as: :log_out
end
