Rails.application.routes.draw do
  root :to => "companies#index"

  resources :companies do
    resources :locations
  end

  resources :companies do
    resources :technologies
  end
  resources :technologies, :only => [:show]

  resources :users
  get "/pages/:page" => "pages#show"

  # resources :sessions, :as => "log_in", :only => [:new, :create]
  # resources :sessions, :only => [:new, :create]
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get '/log-out' => 'sessions#destroy', as: :log_out
end
