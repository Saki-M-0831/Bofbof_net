Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: "pages#about"
  

  namespace :admin do
    get 'pages/home'
    get 'users/index'

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
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  namespace :likes do
    post 'comment_like'
    delete 'comment_dislike'
  end
end
