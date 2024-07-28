=begin
  question_controller.rb - Project 6
  Created 07/20/24 by Hengkai Zheng:
    This controller handles the questions;
    all other routes are handled by Devise.
  Edited 07/23/24 by Nicholas Colacarro: Added edit and show
  Edited 07/23/24 by Jamaal Wairegi: Edited for incorrect choices
=end

# Created 07/20/24 by Hengkai Zheng
class QuestionsController < ApplicationController
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build
  end

  # Edited 07/26/24 by Jamaal Wairegi: Now redirects to question edit page
  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build(question_params)
    if @question.save
      redirect_to edit_quiz_question_path(@quiz, @question), notice: 'Question was successfully created. Note that all questions must have at least one correct and one incorrect question to have the entire quiz be playable.'
    else
      render :new
    end
  end

  def show
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:id])
  end

  def edit
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:id])
    @correct_choices = @question.correct_choices
    @incorrect_choices = @question.incorrect_choices
  end

  def update
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:id])
    if @question.update(question_params)
      redirect_to quiz_path(@quiz), notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    quiz = Quiz.find(params[:quiz_id])
    question = quiz.questions.find(params[:id])
    if question.present?
      question.destroy
    end
    redirect_to quiz_path(quiz), notice: 'Question deleted.'
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
