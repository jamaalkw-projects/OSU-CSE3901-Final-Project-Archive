# Edited 07/19/24 by Jamaal Wairegi: Removed Landing Page routes
# Edited 07/20/24 by Jamaal Wairegi: Created routes specifically for the Users view
# Edited 07/20/24 by Hengkai: Created routes for search user and quiz, create question for quiz
# Edited 07/21/24 by Sirojiddin Aripov: Changed resources to generate all routes.
# Edited 07/21/24 by Jamaal Wairegi: Edited devise routes for usernames
Rails.application.routes.draw do
  root "home#index"

  resources :quizzes do
  resources :questions, only: [:new, :create]
  end
  get 'index'            => 'quiz_information#index'
  get 'userProfile'      => 'quiz_information#userProfile'
  get 'listQuizUser'     => 'quiz_information#listQuizUser'
  get 'home'             => 'quiz_information#home'
  get 'study'            => 'quiz_information#study'
  get 'host'             => 'quiz_information#host'
  get 'question'         => 'quiz_information#question'
  get 'quizEnd'          => 'quiz_information#quizEnd'

  get 'questions/new'
  get 'questions/create'
  get 'users/search', to: 'users#search', as: 'search_users'
  get 'quiz_search/search', to: 'quiz_search#search', as: 'search_quiz_search'

  # get "/quizzes", to: "quizzes#index"
  # get "/quizzes/new", to: "quizzes#new"
  # post "/quizzes", to: "quizzes#create"
  # get "/quizzes/:id", to: "quizzes#show"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Users routes, provided by Devise
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Users view routes, which use actions from the UsersView controller
  get "/users", to: "users_view#index"
  get "/users/:id", to: "users_view#show"
  get "/users/edit", to: "users_view#edit"

  # Join game route
  get "/join_game", to: "join_game#index"
end
