Rails.application.routes.draw do
  get 'likes/create'

  get 'likes/destroy'

  get 'password_resets/new'

  get 'password_resets/edit'

  get '/login' => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  post '/signup' => 'users#create'
  get '/signup' =>  "users#new"

  root 'static_pages#home'

  get 'static_pages/help'
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :stories
  resources :likes,               only: [:create, :destroy]                  
end
