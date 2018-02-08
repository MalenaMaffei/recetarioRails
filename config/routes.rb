Rails.application.routes.draw do


  # get 'logout' => 'users/sessions#destroy', :as => 'logout'
  # Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  # end

  # devise_for :users
  get 'comments/create'



  post 'access/attempt_login'


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
