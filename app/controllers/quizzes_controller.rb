=begin
  question_controller.rb - Project 6
  Created 07/20/24 by Hengkai Zheng:
    This controller handles the questions;
    all other routes are handled by Devise.
=end
class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to @quiz
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @test = "hello"
  end

  def destroy
    quiz = Quiz.find(params[:id])
    if quiz.present?
      quiz.destroy
    end
    redirect_to root_path
  end



  private

  def quiz_params
    params.require(:quiz).permit(:quiz_name)
  end

end
