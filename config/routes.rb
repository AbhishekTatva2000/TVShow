Rails.application.routes.draw do
  root to: "home#index"
  get '/home/index', to: 'home#index'
  get '/home/show', to: 'home#show', as: "fav_show"
  get '/search', to: 'home#search', as: "search" 
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine => '/ckeditor'
  post "home/add_to_fav/:id", to: "home#add_to_fav", as: "add_to_fav"
  delete "home/remove_from_fav/:id", to: "home#remove_from_fav", as: "remove_from_fav"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'
end
