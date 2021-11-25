Rails.application.routes.draw do
  get 'notices/index'
  get 'notices/show'
  root 'pages#home'
  get '/about', to: "pages#about"

  namespace :admin do
    get 'pages/home'
    get 'users/index'
    get 'contacts/index'
    patch 'contacts/update'

    resources :posts, only: [:index, :new, :create, :edit, :update, :destroy] do
      member do
        patch "publicate"
        patch "withdraw"
      end

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
      
      resources :comments, only: [:create, :destroy] 
    end

    resources :users do
      member do
        patch "set_admin"
        patch "remove_admin"
      end
    end

    resources :notices, only: [:index, :new, :create, :edit, :update, :destroy] do
      member do
        patch "publicate"
        patch "withdraw"
      end
    end

    resources :videos
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :videos, only: [:index]
  resources :posts, only: [:index]
  resources :contacts, only: [:create]
  resources :notices, only: [:index, :show]

  namespace :likes do
    post 'comment_like'
    delete 'comment_dislike'
  end
end
