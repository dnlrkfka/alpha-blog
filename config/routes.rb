Rails.application.routes.draw do

  root 'pages#homepage'

  get '/about' => 'pages#about'
  
  resources :articles
  
  get 'signup' => 'users#new'
  # post 'users' => 'users#create'
  resources :users, except: [:new]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
