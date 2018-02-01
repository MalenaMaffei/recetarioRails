Rails.application.routes.draw do

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

  resources :notifications, only: [:index]

  get ':token', :to => 'recipes#show_shareable'

end
