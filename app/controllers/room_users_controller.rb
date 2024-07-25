class RoomUsersController < ApplicationController
=begin
  Created on 07/24/24 by Sirojiddin Aripov
  @description shows that users join into quiz
  @updates @room in show.html.erb
  @params id is needed in the params AKA in the URL
  @returns n/a
=end
  def join
    @room = Room.find(params[:id])
    if !@room.room_users.exists?(user_id: current_user.id)
      @room_user = @room.room_users.new(user_id: current_user.id, room_id: @room.id, score: 0, username: current_user.username)

      if @room_user.save
        redirect_to quiz_room_path(@room.quiz, @room)
      else
        render join_quiz_room_user_path(@room.quiz, @room)
      end
    else
      redirect_to quiz_room_path(@room.quiz, @room)
    end
  end

end
