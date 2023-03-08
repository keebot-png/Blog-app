require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  before :each do
    @user1 = User.create(name: 'Simon', photo: 'https://randomuser.me/api/portraits/men/1.jpg',
                          bio: 'Teacher in South Africa', posts_counter: 23)

    @post1 = Post.create(author: @user1, title: 'My first blog',
                          text: 'This is the blog 1 description that I wrote', comments_counter: 10, likes_counter: 82)

    @comment1 = Comment.create(text: 'My first comment', author: @user1, post: @post1)

    visit user_posts_path(@user1.id)
  end

  it 'can see the photo for this user' do
    expect(page).to have_css("img[src*='https://randomuser.me/api/portraits/men/1.jpg']")
  end

  it 'can see the username for this user' do
    expect(page).to have_content('Simon')
  end

  it 'can see the post counter for this user' do
    expect(page).to have_content(@user1.posts_counter)
  end

  it 'can see a posts title' do
    expect(page).to have_content('My first blog')
  end

  it 'can the first comment on a post' do
    expect(page).to have_content('My first comment')
  end

  it 'can see a posts body' do
    expect(page).to have_content('This is the blog 1 description that I wrote')
  end

  it 'can see how many comments a post has' do
    expect(page).to have_text("Comments: 10")
  end

  it 'can see how many likes a post has' do
    expect(page).to have_text("Likes: 82")
  end

  it 'can see a section for pagination' do
    visit("/users/#{@user1.id}/posts")

    expect(page).to have_link('1', href: "/users/#{@user1.id}/posts?posts=1")
    expect(page).to have_link('2', href: "/users/#{@user1.id}/posts?posts=2")
    expect(page).to have_link('3', href: "/users/#{@user1.id}/posts?posts=3")

    click_link('2')

    expect(page).to have_current_path("/users/#{@user1.id}/posts?posts=2")
  end

  it 'links to the posts#index page when you click show all posts' do
  user1 = @user1.id
  post1 = @post1.id
  click_link('My first blog')

  expect(page).to have_current_path("/users/#{user1}/posts/#{post1}")
  end
end