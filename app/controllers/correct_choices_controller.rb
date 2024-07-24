=begin
  correct_choices_controller.rb - Project 6
  Created 07/23/24 by Nicholas Colacarro:
    This controller handles correct choices for questions.
=end

class CorrectChoicesController < ApplicationController
    before_action :set_question
    before_action :set_correct_choice, only: %i[update destroy]
  
    def index
      @correct_choices = @question.correct_choices
    end

    def new
      @correct_choice = @question.correct_choices.build
    end

    def create
      @correct_choice = @question.correct_choices.build(correct_choice_params)
      if @correct_choice.valid?
        @correct_choice.save
        redirect_to edit_quiz_question_path(@question.quiz, @question), notice: 'Correct choice was successfully created.'
      else
        redirect_to new_quiz_question_correct_choice_path(@question.quiz, @question), alert: @correct_choice.errors.to_hash
      end
    end
  
    def update
      if @correct_choice.update(correct_choice_params)
        redirect_to edit_quiz_question_path(@question.quiz, @question), notice: 'Correct choice was successfully updated.'
      else
        render :edit
      end
    end
  
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
