=begin
  question_controller.rb - Project 6
  Edited 07/20/24 by Hengkai Zheng:
    This controller handles the questions;
    all other routes are handled by Devise.
  Edited 07/22/24 by Nicholas Colacarro: Added first_question instance variable
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
    @first_question = @questions.first
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
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to @quiz
    else
      render :new, status: :unprocessable_entity
    end
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
