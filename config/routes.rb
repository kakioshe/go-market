Rails.application.routes.draw do
  get '/store' => 'store#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/login' => 'sessions#new'
  get '/register' => 'registrations#new'
  post '/register' => 'registrations#create'
end
