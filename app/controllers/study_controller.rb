=begin
  study_controller.rb - Project 6
  Created 07/22/24 by Nicholas Colacarro:
    This controller handles the pages for studying;
  Edited 07/23/24 by Nicholas Colacarro: Added score and handling submitting answers
  Edited 07/23/24 by Nicholas Colacarro: Removed score.
  Edited 07/26/24 by Nicholas Colacarro: Got rid of submit_answer to be completed in the view with JavaScript.
=end

class StudyController < ApplicationController
  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions.order(:created_at)
    @first_question = @questions.first
    session[:total_questions] = @questions.count
    session[:shuffled_choices] = true 
  end

  def question
    @question = Question.find(params[:id])
    @questions = @question.quiz.questions.order(:created_at)
    @question_index = @questions.index(@question) + 1
    @total_questions = @questions.count

    # Check to see if choices need to be shuffled.
    if session[:shuffled_choices]
      @shuffle_choices = true
      session[:shuffled_choices] = false
    else
      @shuffle_choices = false
    end

    # Retrieve or store shuffled choices order.
    session[:choices_order] ||= {}
    if session[:choices_order][@question.id.to_s]
      @choices = session[:choices_order][@question.id.to_s]
    else
      @choices = @question.incorrect_choices.map(&:option) + @question.correct_choices.map(&:option)
      @choices.shuffle! if @shuffle_choices
      session[:choices_order][@question.id.to_s] = @choices
    end

    session[:answered_questions] ||= []
  end


  def next_question
    question = Question.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    @questions = @quiz.questions.order(:created_at)
    @current_question = @questions.find_by(id: params[:id])
    @next_question = @questions.where('created_at > ?', @current_question.created_at).first
  
    session[:shuffled_choices] = true
  
    # Go to next question or go to end quiz screen if it is the last question.
    if @next_question
      redirect_to study_question_path(@next_question, quiz_id: @quiz.id)
    else
      redirect_to end_quiz_path(question.quiz_id)
    end
  end

  def previous_question
    @quiz = Quiz.find(params[:quiz_id])
    @questions = @quiz.questions.order(:created_at)
    @current_question = @questions.find_by(id: params[:id])
    @previous_question = @questions.where('created_at < ?', @current_question.created_at).last
  
    # Go to the previous question or go to the study screen if it is the first question.
    if @previous_question
      redirect_to study_question_path(@previous_question, quiz_id: @quiz.id)
    else
      redirect_to study_quiz_path(@quiz)
    end
  end

  def end
    @quiz = Quiz.find(params[:id])
    
    session[:shuffled_choices] = nil  
    @total_questions = session[:total_questions] || @quiz.questions.count
    session[:total_questions] = nil
  end
end
