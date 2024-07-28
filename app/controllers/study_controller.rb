=begin
  study_controller.rb - Project 6
  Created 07/22/24 by Nicholas Colacarro:
    This controller handles the pages for studying;
  Edited 07/23/24 by Nicholas Colacarro: Added score and handling submitting answers
  Edited 07/23/24 by Nicholas Colacarro: Removed score.
  Edited 07/26/24 by Nicholas Colacarro: Got rid of submit_answer to be completed in the view with JavaScript.
  Edited 07/27/24 by Nicholas Colacarro: Update the study mode when new choices are added to the questions.
  Edited 07/27/24 by Hengkai Zheng : make it selectable and able to confirm before user decision  in study
=end

class StudyController < ApplicationController
  # Created 07/24/24 by Nick Colacarro
  # @description: shows the questions of a single quiz.
  # @updates: @quiz, @questions, and @first_question to be used in show.html.erb
  # @params: [Integer] :id - ID of the quiz
  # @returns: N/A
  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions.order(:created_at)
    @first_question = @questions.first
    session[:total_questions] = @questions.count
    session[:shuffled_choices] = true
    session[:choices_order] = {}  # Clear the choices order session
  end

  # Created 07/24/24 by Nick Colacarro
  # @description: Shows a specific question of the quiz
  # @updates: @question, @questions, @question_index, and @total_questions to be used in question.html.erb
  # @params: [Integer] :id - ID of the question.
  # @returns: N/A
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

  # Created 07/24/24 by Nick Colacarro
  # @description: Redirects to next question or end quiz.
  # @updates: session[:shuffled_choices] - Boolean to indicate if choices need to be shuffled.
  # @params: [Integer] :id - ID of the question. [Integer] :quiz_id - ID of the quiz.
  # @returns: [Redirect] Redirects to next question or end quiz.
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

  # Created 07/24/24 by Nick Colacarro
  # @description: Redirects to previous question or quiz overview.
  # @updates: N/A
  # @params: [Integer] :id - ID of the question. [Integer] :quiz_id - ID of the quiz.
  # @returns: [Redirect] Redirects to previous question or quiz overview.
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

  # Created 07/24/24 by Nick Colacarro
  # Edited 07/27/24 by Sameul Colston : add track score
  # Edited 07/27/24 by Hengkai Zheng : make it selectable and able to confirm before user decision (refactored the score)
  # @description: Handles the submission of selected answers for a question and provides feedback.
  # @updates: Sets flash messages for correct or incorrect answers, tracks scores.
  # @params: [Array<String>] :selected_choices - Array of selected choices.
  #          [Integer] :question_id - ID of the question.
  #          [Integer] :quiz_id - ID of the quiz.
  # @returns: [Redirect] Redirects to the same question with feedback.
  def submit_answer
    @question = Question.find(params[:question_id])
    selected_choices = params[:selected_choices] || []

    correct_choices = @question.correct_choices.map(&:option)
    incorrect_choices = @question.incorrect_choices.map(&:option)

    if (selected_choices - correct_choices).empty? && (correct_choices - selected_choices).empty?
      flash[:correct] = "Correct! #{selected_choices.join(', ')} are the right answers."
      session[:score] ||= 0
      session[:score] += 1
    else
      flash[:incorrect] = "Incorrect! #{selected_choices.join(', ')} are not the right answers."
    end

    quiz_id = @question.quiz_id
    @score = Scoreboard.find_or_create_by(quiz_id: quiz_id, user_id: current_user.id)
    @score.answered += 1
    @score.answered_correct += 1 if (selected_choices - correct_choices).empty? && (correct_choices - selected_choices).empty?
    @score.save

    # Check to see if question has already been answered.
    answered_questions = session[:answered_questions] || []
    answered_questions << @question.id unless answered_questions.include?(@question.id)
    session[:answered_questions] = answered_questions

    redirect_to study_question_path(@question, quiz_id: params[:quiz_id])
  end

  def end
    @quiz = Quiz.find(params[:id])

    session[:shuffled_choices] = nil
    @total_questions = session[:total_questions] || @quiz.questions.count
    session[:total_questions] = nil
  end
end
