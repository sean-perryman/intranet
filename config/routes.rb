Rails.application.routes.draw do
  resources :locations

  resources :vm_problems, :users

  get '/tickets/open' => 'tickets#open'
  get '/tickets/closed' => 'tickets#closed'

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  resources :tickets
  
  root 'home#index'
end