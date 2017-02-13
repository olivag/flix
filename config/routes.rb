Rails.application.routes.draw do

  resources :genres
  get 'signin' => "sessions#new"
  resource :session
  
  get 'signup' => "users#new"
  # get 'users/:username' => "users#show", as: :username_url
  resources :users
  
  root "movies#index"

  get "movies/filter/:scope" => "movies#index", as: :filtered_movies
  resources :movies do
    resources :reviews
    resources :favorites
  end
end
