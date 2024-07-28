=begin
  scores_controller.rb - Project 6
  Created 07/24/24 by Samuel Colston
    This controller handles the actions related to viewing and creating scores.
=end
class ScoresController < ApplicationController

=begin
  Created on 07/26/24 by Samuel Colston
  @description: Gets the page to show all rows in the scoreboards table for the current user for the current quiz.  
  @updates: n/a.
  @params: :quiz_id - Quizzes table's primary key, :user_id - Users table's primary key.
  @returns n/a.
=end
  def index
    @scores = Scoreboard.where(quiz_id: params[:quiz_id])
    @user_ids = @scores.pluck(:user_id)
    @users = User.where(id: @user_ids)
  end

=begin
  Created on 07/26/24 by Samuel Colston
  @description: Gets the page to show the row in the scoreboards table for the current user for the current quiz.  
  @updates: n/a.
  @params: :quiz_id - Quizzes table's primary key, current_user.id - Users table's primary key.
  @returns n/a.
=end
  def show
    @quiz = Quiz.find(params[:quiz_id])
    @score = Scoreboard.find_by(quiz_id: params[:quiz_id], user_id: current_user.id)
  end

=begin
  Created on 07/26/24 by Samuel Colston
  @description: Gets the page to start tracking accuracy.  
  @updates: n/a.
  @params: :quiz_id - Quizzes table's primary key.
  @returns n/a.
=end
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @score = Scoreboard.new
  end

=begin
  Created on 07/26/24 by Samuel Colston
  @description: Creates a row in the scoreboards table for the current user for the current quiz. 
  @updates: @score - creates @score with default values.
  @params: :quiz_id - Quizzes table's primary key, current_user.id - Users table's primary key.
  @returns n/a.
=end
  def create
    @score = Scoreboard.new(quiz_id: params[:quiz_id], user_id: current_user.id, answered: 0, answered_correct: 0)
    @quiz = Quiz.find(params[:quiz_id])
    if @score.save
      redirect_to quiz_score_path(@quiz, @score)
    else
      flash[:error] = @score.errors.full_messages.to_sentence
      render :new
    end
  end

=begin
  Created on 07/26/24 by Samuel Colston
  Edited on 07/28/24 by Samuel Colston: Updated error handling
  @description: Deletes the current user's row for the current quiz from the scoreboards table. 
  @updates: @score - deletes @score.
  @params: :quiz_id - Quizzes table's primary key, current_user.id - Users table's primary key.
  @returns n/a.
=end
  def destroy
    @quiz = Quiz.find(params[:quiz_id])
    @score = Scoreboard.find_by(quiz_id: params[:quiz_id], user_id: current_user.id)
    if @score
      @score.destroy
      redirect_to new_quiz_score_path(@quiz), notice: 'Successfully ended tracking.'
    else
      redirect_to new_quiz_score_path(@quiz), alert: 'No score tracking found.'
    end
  end

end