Rails.application.routes.draw do
  get "category/index" => "category#index", as: "categories"

  post "likes/:story_id" => "likes#like", as: "like"
  delete "likes/:story_id" => "likes#unlike", as: "unlike"

  get "stories/likes" => "stories#likes"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  post "/signup" => "users#create"
  get "/signup" => "users#new"

  root "static_pages#home"

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :stories
  
  namespace :users do
    resources :searches, only: :index
  end
end
