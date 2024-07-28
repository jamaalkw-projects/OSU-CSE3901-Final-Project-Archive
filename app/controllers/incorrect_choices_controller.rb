=begin
  incorrect_choices_controller.rb - Project 6
  Created 07/23/24 by Jamaal Wairegi
=end

# Created 07/23/24 by Nick Colacarro
# Edited 07/23/24 by Jamaal Wairegi: Moved code over from 'correct_choice.rb' to use
class IncorrectChoicesController < ApplicationController
  before_action :set_question
  before_action :set_incorrect_choice, only: %i[update destroy]

  # @description: Displays all incorrect choices of a question
  # @updates: @incorrect_choice in 'incorrect_choice/index.html.erb'
  # @params: N/A
  # @returns: N/A
  def index
    @incorrect_choice = @question.incorrect_choices
  end

  # @description: Displays form for creating an incorrect choice
  # @updates: @incorrect_choice in 'incorrect_choice/new.html.erb'
  # @params: N/A
  # @returns: N/A
  def new
    @incorrect_choice = @question.incorrect_choices.build
  end

  # Created 07/23/24 by Nick Colacarro
  # Edited 07/25/24 by Jamaal Wairegi
  # @description: Creates an incorrect choice
  # @updates: entry of incorrect choice in model
  # @params: N/A
  # @returns: N/A
  def create
    @incorrect_choice = @question.incorrect_choices.build(incorrect_choice_params)
    if @incorrect_choice.valid?
      @incorrect_choice.save
      redirect_to edit_quiz_question_path(@question.quiz, @question), notice: 'Incorrect choice was successfully created.'
    else
      redirect_to new_quiz_question_incorrect_choice_path(@question.quiz, @question), alert: @incorrect_choice.errors.to_hash
    end
  end

  # Created 07/23/24 by Nick Colacarro
  # @description: Updates the answer of an incorrect choice
  # @updates: entry of incorrect choice in model
  # @params: N/A
  # @returns: N/A
  def update
    if @incorrect_choice.update(incorrect_choice_params)
      redirect_to edit_quiz_question_path(@question.quiz, @question), notice: 'Incorrect choice was successfully updated.'
    else
      redirect_to edit_quiz_question_path(@question.quiz, @question), notice: 'Incorrect choice was NOT successfully updated (error).'
    end
  end

  # Created 07/23/24 by Nick Colacarro
  # @description: Deletes an incorrect choice
  # @updates: entry of incorrect choice in model
  # @params: N/A
  # @returns: N/A
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
