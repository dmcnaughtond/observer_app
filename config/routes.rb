Rails.application.routes.draw do

  

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'



	  root 'static_pages#home'
    get '/signup',        to: 'users#new'
    post '/signup',       to: 'users#create'
    get    '/login',      to: 'sessions#new'
    post   '/login',      to: 'sessions#create'
    delete '/logout',     to: 'sessions#destroy'
    get '/showall',       to: 'users#index'
    get '/createroom',    to: 'rooms#new'
    post '/createroom',   to: 'rooms#create'
    get '/createstudent',  to: 'students#new'
    get '/createstudent',  to: 'students#create'
    get '/users/:user_id/rooms/:room_id', to: "rooms#show"

    
    resources :users
    resources :users, only: [:show] do
      resources :rooms, only: [:show, :index]
    end

    resources :rooms, only: [:index, :show, :new, :create, :destroy, :edit, :update]
    resources :students
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]

  	


end


  # root                'static_pages#home'
  # get 'help'      =>  'static_pages#help'


  # get 'static_pages/home' => 'application#hello'

  # get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'
