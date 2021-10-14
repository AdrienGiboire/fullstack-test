Rails.application.routes.draw do
  get '/api/recipes/search', to: 'api/recipes#search'
end
