Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: "pages#about"

  namespace :admin do
    get 'pages/home'
    get 'users/index'

    resources :posts, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :dtopics, only: [:create, :destroy] do
        member do
          patch "d_choose"
          patch "d_omit"
        end
      end
      resources :itopics, only: [:create, :destroy] do
        member do
          patch "i_choose"
          patch "i_omit"
        end
      end
    end

    resources :users do
      member do
        patch "set_admin"
        patch "remove_admin"
      end
    end
  end

  resources :users
end
