# app/controllers/quiz_search_controller.rb
class QuizSearchController < ApplicationController
  def search
    if params[:query].present?
      @quizzes = Quiz.where('quiz_name LIKE ?', "%#{params[:query]}%")
    else
      @quizzes = Quiz.none
    end
  end
end
