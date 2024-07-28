=begin
  users_controller.rb - Project 6
  Created 07/20/24 by Hengkai Zheng:
    This controller handles the user(search for now);
=end

# Created 07/20/24 by Hengkai Zheng
#   Created 'search' action. This action search the user by its username
class UsersController < ApplicationController


  # Created 07/22/24 by Samuel Colston
  #   Created 'update' action. This action allows the user to update their username.
  def user_params
    params.require(:user).permit(:username)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path(@user), notice: 'User was successfully updated.'
    else
      Rails.logger.debug(@user.errors.full_messages)
      flash[:error] = @user.errors.full_messages.to_sentence
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'User account deleted.'
  end

end
