require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users/'
    end

    it 'Returns a http success code' do
      get '/users/'
      expect(response).to have_http_status(:success)
    end

    it 'should return index' do
      expect(response).to render_template(:index)
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Here are the lists of users')
    end
  end

  describe 'GET /show' do
    before :each do
      @user = User.create(
        name: 'Keenan',
        photo: 'photo',
        bio: 'Best golfer ever',
        posts_counter: 1
      )
      get "/users/#{@user.id}"
    end

    it 'Returns a http success code' do
      expect(response).to have_http_status(:success)
    end

    it 'should return show' do
      expect(response).to render_template(:show)
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Here is a single user')
    end
  end
end
