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


  resources :my_recipes, controller: 'saved_recipes', only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    collection do
      get :friends_recipes, as: :friends_recipes
    end
  end

  get '/find_friends' => 'friends#show'
  post '/find_friends/:id' => 'friends#send_request'
  delete '/find_friends/:id' => 'friends#destroy'
  patch '/find_friends/:id' => 'friends#accept_request'

  resources :recipes do
    resources :reviews, only: [:create, :destroy, :edit, :update]
  end

  post '/my_recipes/create' => 'saved_recipes#create'
end
