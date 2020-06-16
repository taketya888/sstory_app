Rails.application.routes.draw do
  post 'likes/:story_id/create' => "likes#create"
  delete "likes/:story_id/destroy" => "likes#destroy"
  
  get "stories/likes" => "stories#likes"
  
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
end
