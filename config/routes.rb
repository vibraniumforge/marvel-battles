Rails.application.routes.draw do
  
  root "static_pages#home"
  resources :battles
  resources :characters
  resources :movies
  resources :superpowers
  get '/signin', to: "session#new"
  post '/signin', to: "sessiom#create"
  delete '/session', to: "session#destroy"

  get '/auth/facebook/callback' => 'sessions#create'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
end
