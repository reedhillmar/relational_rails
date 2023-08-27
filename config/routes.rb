Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#index"
  get "/artists", to: "artists#index"
  get "/artists/new", to: "artists#new"
  post "/artists", to: "artists#create"
  get "/artists/:id", to: "artists#show"
  get "/albums", to: "albums#index"
  get "/albums/new", to: "albums#new"
  post "/albums", to: "albums#create"
  get "/albums/:id", to: "albums#show"
  get "/artists/:artist_id/albums", to: "artist_albums#index"
  get "/artists/:id/edit", to: "artists#edit"
  patch "/artists/:id", to: "artists#update"
  get "/artists/:artist_id/albums/new", to:"artist_albums#new"
  post "/artists/:artist_id/albums", to:"artist_albums#create"
end
