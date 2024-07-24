=begin
  study_controller.rb - Project 6
  Created 07/22/24 by Nicholas Colacarro:
    This controller handles the pages for studying;
=end

class StudyController < ApplicationController
  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
    @first_question = @questions.first
  end

  def question
    @question = Question.find(params[:id])
  end

  def next_question
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.where("id > ?", params[:id]).first
    if @question
      redirect_to study_question_path(@question, quiz_id: @quiz.id)
    else
      redirect_to quiz_end_path(quiz_id: @quiz.id)
    end
  end

  def previous_question
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.where("id < ?", params[:id]).last
    if @question
      redirect_to study_question_path(@question, quiz_id: @quiz.id)
    else
      redirect_to study_quiz_path(@quiz)
    end
  end

  def end
    @quiz = Quiz.find(params[:quiz_id])
  end
end
