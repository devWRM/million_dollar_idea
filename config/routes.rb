# rails routes
Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  # post '/signup' => 'users#create'      <<= auto built


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'



  # write custom routes above

  resources :resources
  resources :supports
  resources :categories
  resources :goals
  resources :ideas
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
