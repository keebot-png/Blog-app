class LikesController < ApplicationController
  def create
    @like = Like.new(author: current_user, post: Post.find_by(id: params[:post_id]))
    redirect_to user_posts_path(user_id: params[:user_id], id: params[:id]) if @like.save
  end
end
