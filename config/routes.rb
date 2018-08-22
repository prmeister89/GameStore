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
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
