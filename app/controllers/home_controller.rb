class HomeController < ApplicationController
  def index
    @quizzes = Quiz.all
    @users = User.all
  end
  def user_profile
  end
end
