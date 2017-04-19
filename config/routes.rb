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
# Attractions
get '/attractions', to: 'attractions#index', as: :attractions
get '/attractions/new', to: 'attractions#new', as: :new_attraction
post '/attractions', to: 'attractions#create'
get '/attractions/:id', to: 'attractions#show', as: :attraction
get '/attractions/:id/edit', to: 'attractions#edit', as: :edit_attraction
patch '/attractions/:id', to: 'attractions#update'

# Rides
post 'rides/new', to: 'rides#new'


end
