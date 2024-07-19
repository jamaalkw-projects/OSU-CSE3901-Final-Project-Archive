Rails.application.routes.draw do
  root 'quiz_information#index'

  get 'index'            => 'quiz_information#index'
  get 'userProfile'      => 'quiz_information#userProfile'
  get 'listQuizUser'     => 'quiz_information#listQuizUser'
  get 'home'             => 'quiz_information#home'
  get 'study'            => 'quiz_information#study'
  get 'host'             => 'quiz_information#host'
  get 'question'         => 'quiz_information#question'
  get 'quizEnd'          => 'quiz_information#quizEnd'
  
end
