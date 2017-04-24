Rails.application.routes.draw do
  devise_for :users,
    path_names: {
     sign_in: 'sign-in', sign_out: 'sign-out', password: 'secret',
     sign_up: 'sign-up'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :comments, except: [:index, :new, :show]

  resources :friendships, only: [:create, :destroy]

  root to: 'main#index'
end
