Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users
  get '/events/new', to: 'events#new'
  post '/events', to: 'events#create'
  get '/events/:id', to: 'events#show', as: 'event'
  post '/events/:id', to: 'events#signup', as:'event_signup'
  get '/events', to: 'events#index'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
