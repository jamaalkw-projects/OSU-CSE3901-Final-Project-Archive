# Edited 07/19/24 by Jamaal Wairegi: Removed Landing Page routes
# Edited 07/20/24 by Jamaal Wairegi: Created routes specifically for the Users view
Rails.application.routes.draw do
  get 'users/search', to: 'users#search', as: 'search_users'
  get 'quiz_search/search', to: 'quiz_search#search', as: 'search_quiz_search'
  root "home#index"
  resources :quizzes
  # get "/quizzes", to: "quizzes#index"
  # get "/quizzes/new", to: "quizzes#new"
  # post "/quizzes", to: "quizzes#create"
  # get "/quizzes/:id", to: "quizzes#show"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Users routes, provided by Devise
  devise_for :users

  # Users view routes, which use actions from the UsersView controller
  get "/users", to: "users_view#index"
  get "/users/:id", to: "users_view#show"
  get "/users/edit", to: "users_view#edit"

  # Join game route
  get "/join_game", to: "join_game#index"
end
