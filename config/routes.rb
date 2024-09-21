Rails.application.routes.draw do
  root "pages#home"
  devise_for :users

  resources :users do
    member do
      post "follow"
      delete "unfollow"
      get "followers"
      get "followings"
    end

    resources :posts, only: [ :index, :show, :new, :create ] do
      resources :comments, only: [ :create ]
    end
  end
end
