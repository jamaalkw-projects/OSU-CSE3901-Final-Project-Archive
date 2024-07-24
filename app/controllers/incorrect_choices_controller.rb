=begin
  incorrect_choices_controller.rb - Project 6
  Created 07/23/24 by Jamaal Wairegi
=end

class IncorrectChoicesController < ApplicationController
  before_action :set_question
  before_action :set_incorrect_choice, only: %i[update destroy]

  def index
    @incorrect_choice = @question.incorrect_choices
  end

  def new
    @incorrect_choice = @question.incorrect_choices.build
  end

  def create
    @incorrect_choice = @question.incorrect_choices.build(incorrect_choice_params)
    if @incorrect_choice.save
      redirect_to edit_quiz_question_path(@question.quiz, @question), notice: 'Incorrect choice was successfully created.'
    else
      render :new
    end
  end

  def update
    if @incorrect_choice.update(incorrect_choice_params)
      redirect_to edit_quiz_question_path(@question.quiz, @question), notice: 'Incorrect choice was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @incorrect_choice.destroy
    redirect_to edit_quiz_question_path(@question.quiz, @question), notice: 'Incorrect choice was successfully destroyed.'
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_incorrect_choice
    @incorrect_choice = @question.incorrect_choices.find(params[:id])
  end

  def incorrect_choice_params
    params.require(:incorrect_choice).permit(:option)
  end
end
