class RoomsController < ApplicationController
  before_action :set_quiz
=begin
  Created on 07/24/24 by Sirojiddin Aripov
  @description shows a all rooms in index.html.erb layout based on ID
  @updates @quiz in show.html.erb
  @params id is needed in the params AKA in the URL
  @returns n/a
=end
  def index
    @rooms = @quiz.rooms
  end
=begin
  Created on 07/24/24 by Sirojiddin Aripov
  @description creates a blank room with id
  @updates @quiz in DB
  @params n/a
  @returns n/a
=end
  def new
    @room = @quiz.rooms.build
  end
=begin
  Created on 07/24/24 by Sirojiddin Aripov
  @description shows a single room in show.html.erb layout based on ID
  @updates @room in show.html.erb
  @params id is needed in the params AKA in the URL
  @returns n/a
=end
  def show
    @quiz
    @room = @quiz.rooms.find(params[:id])
  end
=begin
  Created on 07/19/24 by Sirojiddin Aripov
  @description creates a room with given information and attempts to save.
  @updates @quiz in DB
  @params n/a
  @returns n/a
=end
  def create
    @room = @quiz.rooms.build(room_params)
    room_valid = @room.valid?
    if room_valid
      @room.save
      redirect_to quiz_room_path(@quiz, @room)
    else
      render :new
    end
  end

  private
  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end
  def room_params
    params.require(:room).permit(:room_number)
  end
end
