Rails.application.routes.draw do
  resources :songs
  resources :artists
  resources :users, only: [:new, :create, :show]

  root 'welcome#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
