require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = User.new(name: 'Keenan Botes', bio: 'Lives in South Africa', posts_counter: 5)
    @post = Post.new(author: @user, title: 'Best blog ever', text: 'Lives in South Africa', comments_counter: 5,
                     likes_counter: 17)
    @like = Like.new(author: @user, post: @post)
  end

  describe '#likes_count' do
    it 'increments the likes counter by 1' do
      expect { @like.likes_count }.to change { @post.likes_counter }.from(17).to(18)
    end
  end
end
