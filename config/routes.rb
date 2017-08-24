Rails.application.routes.draw do

  devise_for :users

  resources :posts do
    resources :comments, except: [:index, :show]
    member do
      post :likes
      post :unlikes
    end
  end

  resources :users, except: [:destroy, :create] do
    member do
      post :follow
      post :unfollow
      get :followers
      get :followees
      get :news
      post :likes
      post :unlikes
    end
  end
  resources :profiles do
    member do
      post :follow
      post :unfollow
    end
  end

  # resources :dialogs do
  #   resources :messages
  # end

  resources :conversations, only: [:index, :show, :destroy] do
    collection do
      delete :empty_trash
    end
  member do
    post :reply
    post :mark_as_read
  end
  end
  resources :messages, only: [:new, :create] do
    member do
      post :restore
    end
  end
  # post 'users#followers'
 #root 'posts#profile'
  # root 'user', to: 'users#show'
   root 'index#home'
  #root 'profiles'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'users/profile', as: 'user_root'
  # get 'users/show', as: 'users'

end
