Rails.application.routes.draw do

  root 'contents#index'

  resources :contents
  # ####################################
  # Sobre nos
  get 'saudacos' => 'contents#saudacos'
  get 'equipas' => 'contents#equipas'

  # ################################
  resources :uses, except: [:new]
  get '/registar', to: 'uses#new'

  get '/admin', to: 'admins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
