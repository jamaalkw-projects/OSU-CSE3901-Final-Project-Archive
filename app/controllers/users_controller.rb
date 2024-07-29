=begin
  users_controller.rb - Project 6
  Created 07/20/24 by Hengkai Zheng:
    This controller handles the user(search for now);
=end

# Created 07/20/24 by Hengkai Zheng
#   Created 'search' action. This action search the user by its username
# Edited 07/28/24 by Jamaal Wairegi: Moved actions from UsersView to Users
class UsersController < ApplicationController
  # Created 07/20/24 by Jamaal Wairegi
  # @description: Displays all users
  # @updates: @users in 'view/users_view/index.html.erb'
  # @params: N/A
  # @returns: N/A
  def index
    @users = User.all
  end

  # Created 07/20/24 by Jamaal Wairegi
  # @description: Displays a specific user and their created quizzes with a given ID
  # @updates: @users in 'view/users_view/show.html.erb'
  # @params: 'id' attribute from Users model (received from URL)
  # @returns: N/A
  def show
    @user = User.find(params[:id])
    @quizzes = Quiz.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

# Created 07/22/24 by Samuel Colston
# @description: Limits user_params to only include the username attribute.
  def user_params
    params.require(:user).permit(:username)
  end

=begin
  Created on 07/22/24 by Samuel Colston
  @description: Updates the users table with new data for current user's page.
  @updates: @user - replaces @user.username.
  @params: :id - Users table's primary key.
  @returns n/a.
=end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path(@user), notice: 'User was successfully updated.'
    else
      Rails.logger.debug(@user.errors.full_messages)
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to user_edit_path(@user)
    end
  end

=begin
  Created on 07/22/24 by Samuel Colston
  @description: Deletes the current user's row from the users table.
  @updates: @user - deletes @user.
  @params: :id - Users table's primary key.
  @returns n/a.
=end
  def delete
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path, notice: 'User account deleted.'
    else
      redirect_to root_path, alert: 'Failed to delete user account.'
    end
  end
end
