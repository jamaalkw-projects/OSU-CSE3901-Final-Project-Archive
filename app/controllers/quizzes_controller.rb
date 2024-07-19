class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end
  def show
    @quiz = Quiz.find(params[:id])
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

  private
    def quiz_params
      params.require(:quiz).permit(:quiz_name)
    end

end
