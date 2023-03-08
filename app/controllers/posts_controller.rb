class PostsController < ApplicationController
  def index
    @posts = Post.where(params[:id])
    @users_find = User.includes(:posts).find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find_by(id: params[:id])
    return unless @post.nil?

    flash[:error] = 'Post not found'
    redirect_to action: :index
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.likes_counter = 0
    @post.comments_counter = 0

    return unless @post.save

    redirect_to user_posts_path(user_id: params[:user_id])
    flash[:success] = 'Saved Successfully'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
