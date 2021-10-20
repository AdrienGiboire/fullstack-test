Rails.application.routes.draw do
  # could become a POST request if we ever want to cache seachers
  get '/api/recipes/search', to: 'api/recipes/searches#create'

  root to: 'application#index'
end
