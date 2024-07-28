class HomeController < ApplicationController
  def index
    @quizzes = Quiz.all
    @users = User.all
  end

  def search
    query = params[:query]
    if query.present?
      @quizzes = Quiz.where('quiz_name LIKE ?', "%#{query}%")
      @users = User.where('username LIKE ?', "%#{query}%")
    else
      @quizzes = Quiz.none
      @users = User.none
    end
    render :search
  end
end
