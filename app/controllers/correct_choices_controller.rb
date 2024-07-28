=begin
  correct_choices_controller.rb - Project 6
  Created 07/23/24 by Nicholas Colacarro:
    This controller handles correct choices for questions.
=end

# Created 07/23/24 by Nicholas Colacarro.
class CorrectChoicesController < ApplicationController
  before_action :set_question
  before_action :set_correct_choice, only: %i[update destroy]
  
  # Created 07/23/24 by Nicholas Colacarro.
  # @description: Displays all correct choices of a question
  # @updates: @correct_choices in 'correct_choices/index.html.erb'
  # @params: N/A
  # @returns: N/A
  def index
    @correct_choices = @question.correct_choices
  end

  # Created 07/23/24 by Nicholas Colacarro.
  # @description: Displays form for creating a correct choice
  # @updates: @correct_choice in 'correct_choice/new.html.erb'
  # @params: N/A
  # @returns: N/A
  def new
    @correct_choice = @question.correct_choices.build
  end

  # Created 07/23/24 by Nicholas Colacarro.
  # Edited 07/24/24 by Jamaal Wairegi: Redirect to incorrect choice only if question was just created (force at least two choices)
  # @description: Creates an correct choice
  # @updates: entry of correct choice in model
  # @params: N/A
  # @returns: N/A
  def create
    @correct_choice = @question.correct_choices.build(correct_choice_params)
    if @correct_choice.valid?
      @correct_choice.save
      redirect_to edit_quiz_question_path(@question.quiz, @question), notice: 'Correct choice was successfully created.'
    else
      redirect_to new_quiz_question_correct_choice_path(@question.quiz, @question), alert: @correct_choice.errors.to_hash
    end
  end

  # Created 07/23/24 by Nicholas Colacarro.
  # @description: Updates the answer of a correct choice
  # @updates: entry of ccorrect choice in model
  # @params: N/A
  # @returns: N/A
  def update
    if @correct_choice.update(correct_choice_params)
      redirect_to edit_quiz_question_path(@question.quiz, @question), notice: 'Correct choice was successfully updated.'
    else
      render :edit
    end
  end
  
  # Created 07/23/24 by Nicholas Colacarro.
  # @description: Deletes a correct choice
  # @updates: entry of correct choice in model
  # @params: N/A
  # @returns: N/A
  def destroy
    @correct_choice.destroy
    redirect_to edit_quiz_question_path(@question.quiz, @question), notice: 'Correct choice was successfully destroyed.'
  end
  
  private
  
  def set_question
    @question = Question.find(params[:question_id])
  end
  
  def set_correct_choice
    @correct_choice = @question.correct_choices.find(params[:id])
  end
  
  def correct_choice_params
    params.require(:correct_choice).permit(:option)
  end
end
