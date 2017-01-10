Rails.application.routes.draw do
  root 'homepage#index'

  resources :events, except: [:destroy]
  delete '/events/:id/delete', to: 'events#destroy', as: "delete_event"

  get '/users/new', to: 'users#new', as: "signup"
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users, except: [:destroy, :new]
  delete '/users/:id/delete', to: 'users#destroy', as: "delete_user"

  delete '/events/:id/attendees', to: 'attendees#destroy', as: "leave_event"
  post '/events/:id/attendees', to: 'attendees#create', as: "attend_event"
  get '/events/:id/attendees', to: 'attendees#index', as: "attendees"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
