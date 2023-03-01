class PostsController < ApplicationController
  def index
    @posts = Post.find(params[:user_id])
    @users_find = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find_by(id: params[:id])
    return unless @post.nil?

    flash[:error] = 'Post not found'
    redirect_to action: :index
  end
end
