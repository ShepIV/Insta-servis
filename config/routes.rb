Rails.application.routes.draw do
  #resources :avatars
  devise_for :users

  resources :profiles do
    resources :avatars
  end
  resources :posts do
    resources :comments
    member do
      post :likes
      post :unlikes
    end
  end

  resources :profiles do
    member do
      post :follow
      post :unfollow
      post :toggle_follow
    end
  end
 #root 'posts#profile'
  root 'profiles#index'
  #root 'profiles'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'users/profile', as: 'user_root'
  # get 'users/show', as: 'users'

end
