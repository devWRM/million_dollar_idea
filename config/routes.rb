Rails.application.routes.draw do
  resources :resources
  resources :supports
  resources :categories
  resources :goals
  resources :ideas
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
