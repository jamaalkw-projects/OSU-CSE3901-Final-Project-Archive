=begin
  study_controller.rb - Project 6
  Created 07/22/24 by Nicholas Colacarro:
    This controller handles the pages for studying;
  Edited 07/23/24 by Nicholas Colacarro: Added score and handling submitting answers
=end

class StudyController < ApplicationController
  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions.order(:created_at)
    @first_question = @questions.first
    session[:score] = 0;
    session[:total_questions] = @questions.count
  end

  def question
    @question = Question.find(params[:id])
    @questions = @question.quiz.questions.order(:created_at)
    @question_index = @questions.index(@question) + 1
  end

  def next_question
    question = Question.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    @questions = @quiz.questions.order(:created_at)
    @current_question = @questions.find_by(id: params[:id])
    @next_question = @questions.where('created_at > ?', @current_question.created_at).first

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

    if @previous_question
      redirect_to study_question_path(@previous_question, quiz_id: @quiz.id)
    else
      redirect_to study_quiz_path(@quiz)
    end
  end

  def submit_answer
    question = Question.find(params[:question_id])
    selected_choice = params[:selected_choice]

    correct_options = question.correct_choices.pluck(:option)
    correct = correct_options.include?(selected_choice)

    session[:score] ||= 0
    session[:score] += 1 if correct 

    @questions = question.quiz.questions.order(:created_at)
    current_index = @questions.index(question)
    total_questions = @questions.count

    if current_index < total_questions - 1
      next_question = @questions[current_index + 1]
      redirect_to study_question_path(next_question, quiz_id: question.quiz_id)
    else
      redirect_to end_quiz_path(question.quiz_id)
  end
end

  def end
    @quiz = Quiz.find(params[:id])
    
    @score = session[:score] || 0
    @total_questions = session[:total_questions] || @quiz.questions.count

    session[:score] = nil
    session[:total_questions] = nil
  end
end
