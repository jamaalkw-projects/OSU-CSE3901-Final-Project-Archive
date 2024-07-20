class UsersController < ApplicationController
  def search
    if params[:query].present?
      @users = User.where('username LIKE ?', "%#{params[:query]}%")
    else
      @users = User.none
    end
  end
end
