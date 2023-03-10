class UsersController < ApplicationController
  def index
    @users_all = User.all
    @user = current_user
  end

  def show
    if params[:id] == "Sign out"
      redirect_to root_path
    else
    @users_find = User.find(params[:id])
    end
  end
end
