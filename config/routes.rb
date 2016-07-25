Rails.application.routes.draw do
  resources :posts
  resources :users

  post '/users/login' => 'users#login'
  post '/users/follow' => 'users#follow'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
