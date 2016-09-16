Rails.application.routes.draw do
  root :to => "companies#index"

  resources :companies do
    resources :offices
  end

  resources :users
  resources :admin, :only => [:index]

  # resources :sessions, :as => "log_in", :only => [:new, :create]
  # resources :sessions, :only => [:new, :create]
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get '/log-out' => 'sessions#destroy', as: :log_out
end
