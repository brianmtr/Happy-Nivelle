Rails.application.routes.draw do
  get 'users/index'
  get 'agenda/index'
  get 'admins/index'
  resources :homes
  root 'homes#index'
  resources :events
  devise_for :users
  resources :users
  post '/homes/:id', to: 'admins#accepted'
  post '/events/:id', to: 'admins#accept'
  get '/users/index'
  post '/users/:id', to: 'users#role'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
