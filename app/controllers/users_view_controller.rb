=begin
  users_view_controller.rb - Project 6
  Created 07/20/24 by Jamaal Wairegi:
    This controller handles the view of Users;
    all other routes are handled by Devise.
=end

# Created 07/20/24 by Jamaal Wairegi
# Edited 07/23/24 by Jamaal Wairegi: 
#   Created 'edit' action. Note that this action simply leads to the edit user page provided by Devise.
class UsersViewController < ApplicationController
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

  # Created 07/23/24 by Jamaal Wairegi
  # @description: Displays the edit page for th user
  # @updates: @users in the user edit page (provided by Devise)
  # @params: 'id' attribute from Users model (received from URL)
  # @returns: N/A
  def edit
    @user = User.find(params[:id])
  end
end
