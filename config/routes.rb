Rails.application.routes.draw do
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'


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
get '/carts/checkout', to: 'carts#checkout'
resources :users, only: [:show]
resources :stores, only: [:create, :new, :show]
resource :store, only: [:edit, :update]
resource :cart, only: [:show]
resources :order_items, only: [:create, :update, :destroy], defaults: { format: 'js' }
get '/products/:id/deactivate', to: 'products#deactivate'
get '/products/:id/activate', to: 'products#activate'
get '/transactions/checkout', to: 'transaction#checkout'
get '/transactions/execute', to: 'transaction#finish'
get '/store/history', to: 'stores#history'

  match "404", :to => "pages#not_found", :via => :all
  match "500", :to => "pages#internal_server_error", :via => :all
end
