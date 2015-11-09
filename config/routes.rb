Rails.application.routes.draw do
  devise_for :users

  resources :forums do
    resources :topics
  end

  resources :topics do
    resources :comments
  end

  get 'dashboard/index'

  # defaults to dashboard
  root :to => redirect('/dashboard')

  # view routes
  get '/dashboard' => 'dashboard#index'
  get 'pages/blank_page'
  get 'pages/blank_page2'
end
