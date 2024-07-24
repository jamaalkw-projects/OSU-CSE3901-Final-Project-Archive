=begin
  Created on 07/19/24 by Sirojiddin Aripov
  Responsible for quiz events

  question_controller.rb - Project 6
  Edited 07/20/24 by Hengkai Zheng:
    This controller handles the questions;
    all other routes are handled by Devise.
=end
class QuizzesController < ApplicationController
=begin
  Created on 07/19/24 by Sirojiddin Aripov
  @description in index layout allows access to all quizzes in DB
  @updates @quizzes in index.html.erb layout
  @params n/a
  @returns n/a
=end
  def index
    @quizzes = Quiz.all
  end
=begin
  Created on 07/19/24 by Sirojiddin Aripov
  @description creates a blank quiz with ID for user to fill out
  @updates @quiz in new.html.erb
  @params n/a
  @returns n/a
=end
  def new
    @quiz = Quiz.new
  end
=begin
  Created on 07/19/24 by Sirojiddin Aripov
  @description shows a single quiz in show.html.erb layout based on ID
  @updates @quiz in show.html.erb
  @params id is needed in the params AKA in the URL
  @returns n/a
=end
  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end
=begin
  Created on 07/19/24 by Sirojiddin Aripov
  @description creates a quiz with given information and attempts to save.
  @updates @quiz in DB
  @params n/a
  @returns n/a
=end
  def create
    @quiz = Quiz.new(quiz_params)
    quiz_valid = @quiz.valid?
    if quiz_valid
      @quiz.save
      redirect_to @quiz
    else
      render :new
    end
  end
=begin
  Created on 07/19/24 by Sirojiddin Aripov
  @description calls the quiz based on ID fills the form for user to edit
  @updates @quiz in edit.html.erb
  @params id is needed in the params AKA in the URL
  @returns n/a
=end
  def edit
    @quiz = Quiz.find(params[:id])
  end
=begin
  Created on 07/19/24 by Sirojiddin Aripov
  @description this is the put request trying to update the quiz
  @updates @quiz in DB
  @params id is needed in the params AKA in the URL
  @returns n/a
=end
  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to @quiz
    else
      render :new, status: :unprocessable_entity
    end
  end
=begin
  Created on 07/19/24 by Sirojiddin Aripov
  @description finds the quiz by id and requests DB to delete it
  @updates @quiz in DB
  @params id is needed in the params AKA in the URL
  @returns n/a
=end
  def destroy
    quiz = Quiz.find(params[:id])
    if quiz.present?
      quiz.destroy
    end
    redirect_to root_path
  end

  private
=begin
  Created on 07/19/24 by Sirojiddin Aripov
  @description private method to know what properties the quiz must have
  @updates n/a
  @params n/a
  @returns n/a
=end
  def quiz_params
    params.require(:quiz).permit(:quiz_name)
  end

end
