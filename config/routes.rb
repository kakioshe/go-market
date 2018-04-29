Rails.application.routes.draw do
  resource :products

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  resources :products do
    resources :pictures
  end

  get :search, controller: :pages


get '/catalogue', to: 'products#index'
get '/category/:id', to: 'products#showcategory', as: :category
resources :users, only: [:show]
resources :stores, only: [:create, :new, :show]
end
