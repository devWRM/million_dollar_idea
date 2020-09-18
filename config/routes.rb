
Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  # post '/signup' => 'users#create'      <<= auto built


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  ### get '/auth/google_oauth2', to: 'sessions#google'
  # omniauth callback routes below, user either
  # get "/auth/:provider/callback" => 'sessions#google'         <<= :provider is dynamic variable for multiple omniauth
  get "/auth/google_oauth2/callback" => 'sessions#google'     # <<= exact for 1 omniauth


  # write custom routes above

  resources :ideas do
    
    resources :resources, only: [:new, :create, :index] # **
  end

  resources :categories do
    resources :ideas, only: [:index]
    resources :users, only: [:index] # **
  end
  
  # Reduced to just the index
  resources :users do
    resources :ideas, only: [:index]  # :new, :create     <<= All a specific user’s ideas
    resources :resources, only: [:index]
    resources :categories, only: [:index]
  end
  
  
  resources :resources
  resources :supports
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end










