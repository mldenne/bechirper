Rails.application.routes.draw do
  resources :posts
  resources :users
  resources :followings, only: [:create, :destroy]

  post '/users/login' => 'users#login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
