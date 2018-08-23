Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'

  resources :user_games do
    member do
      get :buy
      patch :purchase
    end
  end
  resources :games
  resources :users
  resources :reviews

  get '/', to: 'sessions#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/games/:id/reviews/new', to: 'reviews#new', as: 'new_game_review'
  post '/games/:id/reviews', to: 'reviews#create', as: 'create_game_review'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
