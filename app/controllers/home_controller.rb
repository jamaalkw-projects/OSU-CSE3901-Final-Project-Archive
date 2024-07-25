class HomeController < ApplicationController
  def index
    @quizzes = Quiz.all
    @users = User.all
  end
end
