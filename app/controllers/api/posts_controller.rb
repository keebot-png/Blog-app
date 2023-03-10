class Api::PostsController < Api::ApplicationController
  def index
    @posts = Post.all.where(author_id: params.require(:user_id))
    render json: @posts
  end
end
