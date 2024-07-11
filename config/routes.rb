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
  post '/find_friends' => 'friends#search'
  post '/find_friends/:id' => 'friends#send_request'
  delete '/find_friends/:id' => 'friends#destroy'
  patch '/find_friends/:id' => 'friends#accept_request'

  resources :recipes do
    resources :reviews, only: [:create, :destroy, :edit, :update]
  end

  post '/my_recipes/create' => 'saved_recipes#create'
  get '/my_recipe/:id' => 'saved_recipes#index'
  get '/my_recipe/friends_recipes/:id' => 'saved_recipes#friends_recipes'

  resources :events, only: [:new, :create, :destroy, :edit, :update, :index]
  get '/events/:ids' => 'events#index'

  post '/attendees/invite' => 'attendees#send_invite'
  patch '/events/attendees/accept' => 'attendees#accept_invite'
  delete '/attendees/delete' => 'attendees#remove_attendee'

end
