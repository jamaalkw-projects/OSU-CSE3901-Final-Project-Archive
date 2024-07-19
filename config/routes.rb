Rails.application.routes.draw do
  root "home#index"

  get "/quiz", to: "quiz#index"
  get "/create_quiz", to: "quiz#edit"


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check
end
