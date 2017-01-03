Rails.application.routes.draw do



  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :evenements
  resources :participants
  resources :pages

  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/index'  => 'pages#index'
  get '/signup' => 'users#new'
  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy'



  get 'mycity'   => 'pages#myCity'


  get '/around'   => 'pages#myCity'
  get '/myEvents' => 'evenements#show_my_events'
  get '/allEvents' => 'evenements#show_all_events'
  get '/addEvent' => 'evenements#new'


  get 'users/show'
  get 'users/new'

  get 'evenements/show'
  get 'evenements/admis'


  get 'sessions/new'
end
