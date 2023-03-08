require 'rails_helper'

RSpec.describe 'user#show', type: :feature do
  before :each do
    @user1 = User.create(name: 'Simon', photo: 'https://randomuser.me/api/portraits/men/1.jpg',
                         bio: 'Teacher in South Africa', posts_counter: 23)
    @post1 = Post.create(author: @user1, title: 'My first blog',
                         text: 'This is the blog 1 description that I wrote', created_at: 1.day.ago)
    @post2 = Post.create(author: @user1, title: 'My second blog',
                         text: 'This is the blog 2 description that I wrote', created_at: 2.days.ago)
    @post3 = Post.create(author: @user1, title: 'My third blog',
                         text: 'This is the blog 3 description that I wrote', created_at: 3.days.ago)
    @post4 = Post.create(author: @user1, title: 'My fourth blog',
                         text: 'This is the blog 4 description that I wrote', created_at: 4.days.ago)
    @post5 = Post.create(author: @user1, title: 'My fifth blog',
                         text: 'This is the blog 5 description that I wrote', created_at: 5.days.ago)
    @post6 = Post.create(author: @user1, title: 'My sixth blog',
                         text: 'This is the blog 6 description that I wrote', created_at: 6.days.ago)
    visit user_path(@user1.id)
  end

  it 'can see the username of for the user' do
    expect(page).to have_content('Simon')
  end

  it 'can see the photo of for the user' do
    expect(page).to have_css("img[src*='https://randomuser.me/api/portraits/men/1.jpg']")
  end

  it 'can see the post counter for the user' do
    expect(page).to have_content(@user1.posts_counter)
  end

  it 'can see users bio' do
    expect(page).to have_content(@user1.bio)
  end

  it 'can see the users first three posts' do
    recent_posts = @user1.recent_posts
    recent_posts.each do |post|
      expect(page).to have_content(post.text)
    end
  end

  it 'links to the posts#index page when you click show all posts' do
    click_link 'See all posts'
    expect(page).to have_current_path user_posts_path(@user_1.id)
  end
end
