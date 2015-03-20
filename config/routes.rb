Rails.application.routes.draw do
  get '/tickets/open' => 'tickets#open'
  get '/tickets/closed' => 'tickets#closed'

  resources :tickets

  root 'tickets#index'
end
