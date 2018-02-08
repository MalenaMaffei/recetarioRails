Rails.application.routes.draw do

  get 'sign_up' => 'devise/access#new', :as => 'sign_up'
  # devise_for :users
  get 'comments/create'



  post 'access/attempt_login'

  get 'logout' => 'access#logout', :as => 'logout'

  get 'login' => 'access#login', :as => 'login'



  root 'recipes#index'

  resources :categories

  resources :recipes do
      get :new_version, on: :member
      resources :comments
  end
  resources :users

  # resources :notifications, only: [:index]
  resources :notifications do
      collection do
          post :mark_as_read
      end
  end

  get ':token', :to => 'recipes#show_shareable'

end
