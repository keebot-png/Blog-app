require 'rails_helper'

RSpec.describe 'Create Post', type: :feature do
  scenario 'User creates a new post' do
    # Create a user
    @user1 = User.create(name: 'Simon', photo: 'https://randomuser.me/api/portraits/men/1.jpg',
                         bio: 'Teacher in South Africa', posts_counter: 23)

    @post1 = Post.create(author: @user1, title: 'My first blog',
                         text: 'This is the blog 1 description that I wrote', comments_counter: 10, likes_counter: 82)

    # Visit the new post form
    visit new_user_post_path(@user1.id)

    # Fill in the form with valid data
    fill_in 'Title', with: 'My first post'
    fill_in 'Description of post', with: 'This is my first post on the site.'

    # Submit the form
    click_button 'Create Post'

    # Expect to be redirected to the new post
    expect(page).to have_current_path(user_posts_path(@user1))

    # Expect to see the new post's title and description
    expect(page).to have_content('My first post')
    expect(page).to have_content('This is my first post on the site.')
  end
end
