=begin
  quiz_search_controller.rb - Project 6
  Created 07/20/24 by Hengkai Zheng:
    This controller handles search quiz(maybe combine with quizzes controller later);
=end

# Created 07/20/24 by Hengkai Zheng
#   Created 'search' action. This action search the quiz by its quiz_name
class QuizSearchController < ApplicationController
  def search
    if params[:query].present?
      @quizzes = Quiz.where('quiz_name LIKE ?', "%#{params[:query]}%")
    else
      @quizzes = Quiz.none
    end
  end
end
