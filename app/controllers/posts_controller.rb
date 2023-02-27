class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    return unless @post.nil?

    flash[:error] = 'Post not found'
    redirect_to action: :index
  end
end
