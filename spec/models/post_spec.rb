require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = User.new(name: 'Keenan Botes', bio: 'Lives in South Africa', posts_counter: 5)
    @post = Post.new(author: @user, title: 'Best blog ever', text: 'Lives in South Africa', comments_counter: 5,
                     likes_counter: 17)
  end

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:text) }

  it { should be_valid }

  describe 'when the title is not present' do
    before { @post.title = ' ' }
    it { should_not be_valid }
  end

  describe 'when the title is too long' do
    before { @post.title = 'a' * 300 }
    it { should_not be_valid }
  end

  describe '#recent_comments' do
    it 'returns a length between 0 to 5' do
      expect(@post.recent_comments.length).to be_between(0, 5)
    end
  end

  describe '#post_counter' do
    it 'increments author.postcounter by one' do
      expect { @post.post_counter }.to change { @user.posts_counter }.by(1)
    end
  end
end
