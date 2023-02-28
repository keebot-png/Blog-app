require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: 'Keenan Botes', bio: 'Lives in South Africa', posts_counter: 5)
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:bio) }

  it { should be_valid }

  describe 'when the name is not present' do
    before { @user.name = ' ' }
    it { should_not be_valid }
  end

  describe '#recent_posts' do
    it 'should have a length between 0 and 3' do
      expect(@user.recent_posts.length).to be_between(0, 3)
    end
  end
end
