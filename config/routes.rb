Rails.application.routes.draw do

	root 'static_pages#home'
  	get '/static_pages/home', :to => 'static_pages#home'
  	get '/static_pages/help', :to => 'static_pages#help'

  # root                'static_pages#home'
  # get 'help'      =>  'static_pages#help'


  # get 'static_pages/home' => 'application#hello'

  # get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'

end
