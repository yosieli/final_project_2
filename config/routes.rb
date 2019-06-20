Rails.application.routes.draw do
  resources :autors
  # resources :books
  resources :purchases
  root to: 'users#display_login_form'
  get '/login', to: 'users#display_login_form'
  post '/users/authenticate', to: 'users#authenticate'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/books/new', to: 'books#new'
  # post '/books', to: 'books#add'
  get '/books', to: 'books#index'
  get '/books/search',to:'books#search'
  post '/books/' ,to: 'books#search_form'
  post '/books/create' , to: 'books#create'
  get '/books/:id', to: 'books#show'
  delete '/users', to: 'users#destroy'
  get '/users/:id/edit', to: 'users#edit'
  patch 'users/:id',to: 'users#update'
  
<<<<<<< HEAD
  post '/books' ,to: 'books#search_form'
  delete '/books/:id', to: 'books#destroy'

=======
>>>>>>> a25cb01d13bf813be00942e3d19f447afa4e454c
  

  # post '/users/' ,to: 'users#create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
