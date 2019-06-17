Rails.application.routes.draw do
  resources :autors
  resources :books
  resources :purchases
  resources :users
  get '/login', to: 'users#display_login_form'
  post '/users/authenticate', to: 'users#authenticate'
  # post '/users/' ,to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
