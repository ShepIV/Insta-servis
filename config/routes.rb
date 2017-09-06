Rails.application.routes.draw do
  root 'index#home'
  devise_for :users



  resources :posts do
    resources :comments
    member do
      post :likes
      post :unlikes
    end
  end

  resources :users, except: [:destroy, :create] do
    # resources :avatars
    member do
      post :follow
      post :unfollow
      get :followers
      get :followees
      get :news
      post :likes
      post :unlikes
      get :search
    end
  end

  get 'mailbox' => 'mailbox#index', as: :mailbox_index
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
  # resources :mailbox, only: [:inbox, :sent, :trash]

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  get 'search', to: 'search#search'
  # resources :profiles do
  #   member do
  #     post :follow
  #     post :unfollow
  #   end
  # end

  # resources :dialogs do
  #   resources :messages
  # end

  # resources :conversations, only: [:index, :show, :destroy] do
  #   collection do
  #     delete :empty_trash
  #   end
  # member do
  #   post :reply
  #   post :mark_as_read
  # end
  # end
  # resources :messages, only: [:new, :create] do
  #   member do
  #     post :restore
  #   end
  # end
  # post 'users#followers'
 #root 'posts#profile'
  # root 'user', to: 'users#show'

  #root 'profiles'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'users/profile', as: 'user_root'
  # get 'users/show', as: 'users'

end
