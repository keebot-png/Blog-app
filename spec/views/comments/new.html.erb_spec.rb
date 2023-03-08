require 'rails_helper'

RSpec.describe 'Create Comment', type: :feature do
  scenario 'User creates a new comment' do
    # Create a user
    @user1 = User.create(name: 'Simon', photo: 'https://randomuser.me/api/portraits/men/1.jpg',
                         bio: 'Teacher in South Africa', posts_counter: 23)

    # Create a user
    @post1 = Post.create(author: @user1, title: 'My first blog',
                         text: 'This is the blog 1 description that I wrote', comments_counter: 10, likes_counter: 82)

    # Visit the post's comments form
    visit new_user_post_comment_path(@user1.id, @post1.id)
    fill_in 'Add Comment', with: 'This is my first comment on the post.'

    # Submit the comment
    click_button 'Comment'

    # Expect to be redirected to the post
    expect(page).to have_current_path(user_posts_path(@user1))

    # Expect to see the new comment's text
    expect(page).to have_content('This is my first comment on the post.')
  end
end
