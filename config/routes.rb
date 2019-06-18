Rails.application.routes.draw do
  resources :autors
  # resources :books
  resources :purchases
  
  get '/login', to: 'users#display_login_form'
  post '/users/authenticate', to: 'users#authenticate'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/books/new', to: 'books#new'
  post '/books', to: 'books#add'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  delete '/users', to: 'users#destroy'
  get '/users/:id/edit', to: 'users#edit'
  patch 'users/:id',to: 'users#update'

  

  # post '/users/' ,to: 'users#create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
