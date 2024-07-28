=begin
  scores_controller.rb - Project 6
  Created 07/24/24 by Samuel Colston
    This controller handles the actions related to viewing and creating scores.
=end
class ScoresController < ApplicationController
  def index
    @scores = Scoreboard.where(quiz_id: params[:quiz_id])
    @user_ids = @scores.pluck(:user_id)
    @users = User.where(id: @user_ids)
  end

  def show
    @quiz = Quiz.find(params[:quiz_id])
    @score = Scoreboard.find_by(quiz_id: params[:quiz_id], user_id: current_user.id)
  end
  
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @score = Scoreboard.new
  end

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

  def destroy
    @quiz = Quiz.find(params[:quiz_id])
    @score = Scoreboard.find_by(quiz_id: params[:quiz_id], user_id: current_user.id)
    @score.destroy
    redirect_to new_quiz_score_path(@quiz)
  end
end