class UsersController < ApplicationController
  def index
    @users_all = User.all
  end

  def show
    @users_find = User.find(params[:id])
    @post = Post.find(params[:id])
  end
end
