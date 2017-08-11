Rails.application.routes.draw do
  resources :avatars
  devise_for :users do
    post 'follow',   to: 'socializations#follow'
    post 'unfollow', to: 'socializations#unfollow'
  end

  resources :profiles
  resources :posts
  
 #root 'posts#profile'
  root 'users#profile'
  #root 'profiles'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/profile', as: 'user_root'
  get 'users/show', as: 'users'

end
