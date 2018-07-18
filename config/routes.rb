Rails.application.routes.draw do

  

  get 'sessions/new'



	  root 'static_pages#home'
    get '/signup',     to: 'users#new'
    # post '/signup',  to: 'users#create'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    
    resources :users
  	

  # root                'static_pages#home'
  # get 'help'      =>  'static_pages#help'


  # get 'static_pages/home' => 'application#hello'

  # get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'

end
