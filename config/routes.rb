Rails.application.routes.draw do
  root 'homepage#index'

  delete '/events/:id/delete', to: 'events#destroy', as: "delete_event"

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/users/new', to: 'users#new', as: "signup"
  delete '/users/:id/delete', to: 'users#destroy', as: "delete_user"
  resources :users, except: [:destroy, :new]

  get '/events/:id/attendees', to: 'attendees#index', as: "attendees"
  delete '/events/:id/attendees', to: 'attendees#destroy', as: "leave_event"
  post '/events/:id/attendees', to: 'attendees#create', as: "attend_event"
  resources :events, except: [:destroy]
end
