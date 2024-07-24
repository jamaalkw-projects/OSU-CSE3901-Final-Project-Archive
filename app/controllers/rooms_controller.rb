=begin
  Created on 07/24/24 by Sirojiddin Aripov
  @description creating rooms for other people to join in multiplayer
=end
class RoomsController < ApplicationController
=begin
  Created on 07/24/24 by Sirojiddin Aripov
  @description sets up the index.html
  @updates @rooms in index.html.erb
  @params n/a
  @returns n/a
=end
  def index
    @rooms = Room.all
  end

=begin
  Created on 07/24/24 by Sirojiddin Aripov
  @description gives a blank room to give a room number
  @updates @room in new.html.erb
  @params n/a
  @returns n/a
=end
  def new
    @room = Room.new
  end

=begin
  Created on 07/24/24 by Sirojiddin Aripov
  @description creates a room with given code and attempts to save.
  @updates @room in DB
  @params n/a
  @returns n/a
=end
  def create
    @room = Room.new(room_params)
    room_valid = @room.valid?
    if room_valid
      @room.save
      redirect_to @room
    else
      render :new
    end
  end


  private
=begin
  Created on 07/19/24 by Sirojiddin Aripov
  @description private method to know what properties the room must have
  @updates n/a
  @params n/a
  @returns n/a
=end
  def room_params
    params.require(:room).permit(:name)
  end
end
