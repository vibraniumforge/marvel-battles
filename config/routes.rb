Rails.application.routes.draw do
  
  root "static_pages#home"
  resources :battles
  resources :characters do
    resources :superpowers
  end
  resources :movies
  

  get '/signin', to: "session#new"
  post '/signin', to: "session#create"
  delete '/session', to: "session#destroy"

  get '/auth/facebook/callback' => 'sessions#create'
  
end
