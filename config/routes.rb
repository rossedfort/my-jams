Rails.application.routes.draw do
  resources :songs
  resources :artists
  resources :users, only: [:new, :create]
end
