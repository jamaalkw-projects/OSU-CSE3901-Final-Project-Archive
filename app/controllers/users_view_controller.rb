=begin
  users_view_controller.rb - Project 6
  Created 07/20/24 by Jamaal Wairegi:
    This controller handles the view of Users;
    all other routes are handled by Devise.
=end

# Created 07/0/24 by Jamaal Wairegi
class UsersViewController < ApplicationController
  # Created 07/20/24 by Jamaal Wairegi
  def index
    @users = User.all
  end

  # Created 07/20/24 by Jamaal Wairegi
  def show
    @user = User.find(params[:id])
  end
end
