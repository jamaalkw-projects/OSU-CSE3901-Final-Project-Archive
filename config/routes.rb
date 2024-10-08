# Edited 07/19/24 by Jamaal Wairegi: Removed Landing Page routes
# Edited 07/20/24 by Jamaal Wairegi: Created routes specifically for the Users view
# Edited 07/20/24 by Hengkai: Created routes for search user and quiz, create question for quiz
# Edited 07/21/24 by Sirojiddin Aripov: Changed resources to generate all routes.
# Edited 07/21/24 by Jamaal Wairegi: Edited devise routes for usernames
# Edited 07/22/24 by Nicholas Colacarro: Edited/Added routes for studying. Deleted routes for quiz_information
# Edited 07/22/24 by Samuel Colston: Updated get user/edit route to include :id and added user update and delete route.
# Edited 07/23/24 by Nicholas Colacarro: Edited/Added routes for correct choices for questions.
# Edited 07/23/24 by Nicholas Colacarro: Edited/Added routes to submit answer and for end of quiz
# Edited 07/26/24 by Samuel Colston: Added routes to view scoreboards.
# Edited 07/28/24 by Jamaal Wairegi: Removed UsersView routes
Rails.application.routes.draw do
  root "home#index"

  resources :quizzes do
    resources :scores, only: [:index, :show, :new, :create, :destroy]
    resources :rooms
    resources :room_users  do
      member do
        post 'join'
      end
    end
    resources :questions, only: [:new, :create, :show, :index, :edit, :update, :destroy] do
      resources :correct_choices
      resources :incorrect_choices
    end
      member do
        get 'study', to: 'study#show'
        get 'end', to: 'study#end', as: 'end'
      end
  end

  resources :questions, only: [] do
    member do
      get 'next', to: 'study#next_question'
      get 'previous', to: 'study#previous_question'
      get 'study', to: 'study#question'
    end
  end

  post 'submit_answer', to: 'study#submit_answer'

  get 'questions/new'
  get 'questions/create'
  get 'search', to: 'home#search', as: 'search'

  # get "/quizzes", to: "quizzes#index"
  # get "/quizzes/new", to: "quizzes#new"
  # post "/quizzes", to: "quizzes#create"
  # get "/quizzes/:id", to: "quizzes#show"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Users routes, provided by Devise
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Users viewing and editing routes (from Users controller)
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/edit/:id", to: "users#edit", as: 'user_edit'
  put "/users/edit/:id", to: "users#update"
  delete "/users/edit/:id", to: "users#delete"
end
