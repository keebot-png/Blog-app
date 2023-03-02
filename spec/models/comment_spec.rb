require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.new(name: 'Keenan Botes', bio: 'Lives in South Africa', posts_counter: 5)
    @post = Post.new(author: @user, title: 'Best blog ever', text: 'Lives in South Africa', comments_counter: 5,
                     likes_counter: 17)
    @comment = Comment.new(author: @user, post: @post, text: 'Loving this holiday trip')
  end

  describe '#comments_count' do
    it 'increments the comments counter by 1' do
      expect { @comment.comments_count }.to change { @post.comments_counter }.from(5).to(6)
    end
  end
end
