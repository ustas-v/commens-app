Rails.application.routes.draw do
  devise_for :users,
    path_names: {
     sign_in: 'sign-in', sign_out: 'sign-out', password: 'secret',
     sign_up: 'sign-up'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :comments, except: [:index, :new, :show] do
    member do
      get :reply
    end
  end

  resources :users, only: [:index]
  resources :friendships, only: [:destroy] do
    member do
      post :create
    end
  end

  root to: 'main#index'
end
