class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find_by(id: params[:post_id])
    @comment = Comment.new(post:, author: current_user, text: comment_params[:text])
    redirect_to user_posts_path if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'Post was deleted successfully'
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
