class UsersController < ApplicationController
  def index
    @users_all = User.all
    @user = current_user
  end

  def show
    @users_find = User.find(params[:id])
    @post = Post.find(params[:id])
  end
end
