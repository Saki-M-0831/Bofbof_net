Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: "pages#about"

  namespace :admin do
    get 'pages/home'
    get 'users/index'

    resources :users do
      member do
        patch "set_admin"
        patch "remove_admin"
      end
    end
  end

  resources :users
end
