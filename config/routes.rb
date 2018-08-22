Rails.application.routes.draw do
  resources :user_games do
    member do
      get :buy
      post :purchase
    end
  end
  resources :games
  resources :users
  get 'sessions/new'
  get 'sessions/create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
