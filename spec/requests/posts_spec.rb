require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before :each do
      @user = User.create(
        name: 'Tom',
        photo: 'photo',
        bio: 'Teacher from Mexico.',
        posts_counter: 1
      )
      get "/users/#{@user.id}/posts"
    end

    it 'returns a success http code' do
      expect(response).to have_http_status(:success)
    end
    it 'should render the index action' do
      expect(response).to render_template(:index)
    end

    it 'should include the correct placeholder' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    before :each do
      @user = User.create(
        name: 'Wassim',
        bio: 'Teaches Computer Science at Harvard.',
        posts_counter: 1
      )
      @post = Post.create(
        author: @user,
        title: 'Hello',
        text: 'This is my first post',
        author_id: @user.id,
        comments_counter: 0,
        likes_counter: 0
      )
      get "/users/#{@user.id}/posts/#{@post.id}"
    end

    it 'Returns a http success code' do
      expect(response).to have_http_status(:success)
    end

    it 'should render the show action' do
      expect(response).to render_template(:show)
    end

    it 'should include the correct placeholder' do
      expect(response.body).to match('Here is a single post for a given user')
    end
  end
end
