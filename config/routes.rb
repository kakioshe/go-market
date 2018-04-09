Rails.application.routes.draw do
  resource :products

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  resources :products do
    resources :pictures
  end


get '/catalogue', to: 'products#index'
resources :users, only: [:show]
resources :stores, only: [:create, :new, :show]
end
