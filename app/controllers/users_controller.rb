=begin
  users_controller.rb - Project 6
  Created 07/20/24 by Hengkai Zheng:
    This controller handles the user(search for now);
=end

# Created 07/20/24 by Hengkai Zheng
#   Created 'search' action. This action search the user by its username
class UsersController < ApplicationController
  def search
    if params[:query].present?
      @users = User.where('username LIKE ?', "%#{params[:query]}%")
    else
      @users = User.none
    end
  end
end
