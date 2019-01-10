Rails.application.routes.draw do
  # get 'superpowers/new'
  # get 'superpowers/create'
  # get 'superpowers/edit'
  # get 'superpowers/update'
  # get 'superpowers/destroy'
  # get 'superpowers/index'
  # get 'superpowers/show'
  # get 'movies/new'
  # get 'movies/create'
  # get 'movies/edit'
  # get 'movies/update'
  # get 'movies/destroy'
  # get 'movies/index'
  # get 'movies/show'
  # get 'battles/new'
  # get 'battles/create'
  # get 'battles/edit'
  # get 'battles/update'
  # get 'battles/destroy'
  # get 'battles/index'
  # get 'battles/show'
  # get 'characters/new'
  # get 'characters/create'
  # get 'characters/edit'
  # get 'characters/update'
  # get 'characters/destroy'
  # get 'characters/index'
  # get 'characters/show'

  resources :battles
  resources :characters
  resources :movies
  resources :superpowers

  # get '/auth/facebook/callback' => 'sessions#create'

  # resources :battles, only: [:index, :show, :create, :new]
  # resources :characters, only: [:index, :show, :create, :new]
  # resources :movies, only: [:index, :show, :create, :new]
  # resources :superpowers, only: [:index, :show, :create, :new]

  root "battles#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
end
