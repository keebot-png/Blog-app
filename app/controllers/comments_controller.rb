class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find_by(id: params[:post_id])
    @comment = Comment.new(post:, author: current_user, text: comment_params)
    redirect_to user_posts_path if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
