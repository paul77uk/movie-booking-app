Rails.application.routes.draw do

  resources :movies
  post 'movies/:id', to: 'movies#favorite'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "movies#index"
end
