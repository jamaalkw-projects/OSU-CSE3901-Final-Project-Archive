=begin
  question_controller.rb - Project 6
  Created 07/20/24 by Hengkai Zheng:
    This controller handles the questions;
    all other routes are handled by Devise.
=end

# Created 07/20/24 by Hengkai Zheng
class QuestionsController < ApplicationController
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build(question_params)
    if @question.save
      redirect_to @quiz, notice: 'Question was successfully created.'
    else
      render :new
    end
  end
  private

  def question_params
    params.require(:question).permit(:quiz_id, :content, :correct_answer, :wrong_answer_1, :wrong_answer_2, :wrong_answer_3)
  end
end
