Rails.application.routes.draw do
  post '/signup' => 'users#create'
  get '/signup' =>  "users#new"

  root 'static_pages#home'

  get 'static_pages/help'
  resources :users
end
