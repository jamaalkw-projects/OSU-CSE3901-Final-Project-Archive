Rails.application.routes.draw do
  get 'users/search', to: 'users#search', as: 'search_users'
  root "home#index"
  resources :quizzes
  # get "/quizzes", to: "quizzes#index"
  # get "/quizzes/new", to: "quizzes#new"
  # post "/quizzes", to: "quizzes#create"
  # get "/quizzes/:id", to: "quizzes#show"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check
  devise_for :users
end
