Rails.application.routes.draw do
# resources :users, only: []
# resources :attractions, only: []
# resources :rides, only: []



#Sessions
root to: 'sessions#index'
get '/signin', to: 'sessions#new', as: :signin
post '/sessions', to: 'sessions#create'
delete '/signout', to: 'sessions#destroy', as: :signout
#Users
get '/users/new', to: 'users#new', as: :signup
post '/users', to: 'users#create'
get '/users/:id', to: 'users#show', as: :user

end
