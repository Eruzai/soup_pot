Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'soup_pot#index'

  resources :items

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/recipes' => 'recipe_api#show'
  post '/recipes' => 'recipe_api#search'
  post '/recipes/:id' => 'recipe_api#create'

  get '/my_recipes' => 'saved_recipes#my_recipes'
  get '/my_recipes/create' => 'saved_recipes#new'
  post '/my_recipes/create' => 'saved_recipes#create'
  get '/my_recipes/:id' => 'saved_recipes#show'
  patch '/my_recipes/:id' => 'saved_recipes#edit'
  delete '/my_recipes/:id' => 'saved_recipes#destroy'
  get '/friends_recipes' => 'saved_recipes#friends_recipes'

  get '/find_friends' => 'friends#show'

end
