Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: "pages#about"

  namespace :admin do
    get 'pages/home'
    get 'users/index'

  end

  resources :users
end
