require 'rails_helper'

RSpec.describe 'posts#show', type: :feature do
  before :each do
    @user1 = User.create(name: 'Simon', photo: 'https://randomuser.me/api/portraits/men/1.jpg',
                         bio: 'Teacher in South Africa', posts_counter: 23)

    @user2 = User.create(name: 'Peter', photo: 'https://randomuser.me/api/portraits/women/1.jpg',
                         bio: 'Teacher in Australia', posts_counter: 5)

    @post1 = Post.create(author: @user1, title: 'My first blog',
                         text: 'This is the blog 1 description that I wrote', comments_counter: 10, likes_counter: 82)

    @comment1 = Comment.create(text: 'My first comment', author: @user2, post: @post1)
    visit user_post_path(@user1.id, @post1.id)
  end

  it 'can see a posts title' do
    expect(page).to have_content('My first blog')
  end

  it 'can see who wrote the post' do
    expect(page).to have_content(@post1.author.name)
  end

  it 'can see how many comments a post has' do
    expect(page).to have_content(@post1.comments_counter)
  end

  it 'can see how many likes a post has' do
    expect(page).to have_content(@post1.likes_counter)
  end

  it 'can see a posts body' do
    expect(page).to have_content(@post1.text)
  end

  it 'can username of each commentor' do
    expect(page).to have_content(@comment1.author.name)
  end

  it 'can see the comment text' do
    expect(page).to have_content(@comment1.text)
  end
end
