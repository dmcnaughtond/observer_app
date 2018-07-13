Rails.application.routes.draw do

  

	root 'static_pages#home'
    get '/signup', to: 'users#new'
  	

  # root                'static_pages#home'
  # get 'help'      =>  'static_pages#help'


  # get 'static_pages/home' => 'application#hello'

  # get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'

end
