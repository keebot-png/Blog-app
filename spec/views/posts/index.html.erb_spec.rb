require 'rails_helper';

RSpec.describe 'posts#show', type: :feature do

    before :each do
        @user_1 = User.create(name: 'Simon', photo: 'https://randomuser.me/api/portraits/men/1.jpg', bio: 'Teacher in South Africa', posts_counter: 23)

        @post_1 = Post.create(author: @user_1, title: 'My first blog', text: 'This is the blog 1 description that I wrote', comments_counter: 10, likes_counter: 82)

        @comment_1 = Comment.create(text: 'My first comment', author: @user_1, post: @post_1)

        @post_2 = Post.create(author: @user_1, title: 'My second blog', text: 'This is the blog 2 description that I wrote', comments_counter: 9, likes_counter: 81)

        @comment_2 = Comment.create(text: 'My second comment', author: @user_1, post: @post_2)
        @comment_3 = Comment.create(text: 'My third comment', author: @user_1, post: @post_2)
        @comment_4 = Comment.create(text: 'My fouth comment', author: @user_1, post: @post_2)
        
        @post_3 = Post.create(author: @user_1, title: 'My third blog', text: 'This is the blog 3 description that I wrote', comments_counter: 8, likes_counter: 80)
        @post_4 = Post.create(author: @user_1, title: 'My fourth blog', text: 'This is the blog 4 description that I wrote', comments_counter: 7, likes_counter: 79)
        @post_5 = Post.create(author: @user_1, title: 'My fifth blog', text: 'This is the blog 5 description that I wrote', comments_counter: 6, likes_counter: 78)
        @post_6 = Post.create(author: @user_1, title: 'My sixth blog', text: 'This is the blog 6 description that I wrote', comments_counter: 5, likes_counter: 77)
        visit user_posts_path(@user_1.id)
    end
    
    it 'can see the photo for this user' do
        expect(page).to have_css("img[src*='https://randomuser.me/api/portraits/men/1.jpg']")
    end
    
    it 'can see the username for this user' do
        expect(page).to have_content('Simon')
    end
    
    it 'can see the post counter for this user' do
        expect(page).to have_content(@user_1.posts_counter)
    end    

    it 'can see the users first three posts' do
        recent_posts = @user_1.recent_posts
        recent_posts.each do |post|
            expect(page).to have_content(post.text)
        end
    end
    
    it 'links to the posts#index page when you click show all posts' do
        click_link "See all posts"
        expect(page).to have_current_path user_posts_path(@user_1.id)
    end
end