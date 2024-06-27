Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'soup_pot#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/recipes' => 'recipe_api#show'
  post '/recipes' => 'recipe_api#search'
  post '/recipes/:id' => 'recipe_api#create'

end
