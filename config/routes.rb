# rails routes
Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  # post '/signup' => 'users#create'      <<= auto built


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  # write custom routes above

  
  resources :ideas do
    resources :supports, only: [:new, :create, :index]    # <<= All a specific idea’s supports
    resources :goals, only: [:new, :create, :index]       # <<= All a specific idea’s goals
    # resources :categories, only: [:new, :create, :index]
    # resources :resources, only: [:new, :create, :index]
  end


  # Reduced to just the index
  resources :users do
    resources :ideas, only: [:index]  # :new, :create     <<= All a specific user’s ideas
    resources :supports, only: [:index] # :new, :create   <<= All a specific user’s supports
    resources :goals, only: [:index] #:new, :create       <<= All a specific user’s goals
  end


  resources :ideas  
  resources :users

  resources :supports
  resources :goals

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end






# resources :resources do
  #   resources :supports, only: [:new, :create, :index]
  #   resources :ideas, only: [:new, :create, :index]
  # end
  
  # resources :categories do
  #   resources :goals, only: [:new, :create, :index]
  #   resources :ideas, only: [:new, :create, :index]
  # end
  




