=begin
  users_view_controller.rb - Project 6
  Created 07/20/24 by Jamaal Wairegi:
    This controller handles the view of Users;
    all other routes are handled by Devise.
=end

# Created 07/0/24 by Jamaal Wairegi
# Edited 07/23/24 by Jamaal Wairegi: 
#   Created 'edit' action. Note that this action simply leads to the edit user page provided by Devise.
class UsersViewController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
end
