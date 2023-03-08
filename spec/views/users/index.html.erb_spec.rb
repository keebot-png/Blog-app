require 'rails_helper'

RSpec.describe 'user#index', type: :feature do
  before :each do
    @user1 = User.create(name: 'Simon', photo: 'https://randomuser.me/api/portraits/men/1.jpg',
                         bio: 'Teacher in South Africa', posts_counter: 4)
    @user2 = User.create(name: 'Peter', photo: 'https://randomuser.me/api/portraits/women/1.jpg',
                         bio: 'Teacher in Australia', posts_counter: 5)

    visit users_path
  end

  it 'can see the username of all other users' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  it 'can see the photo of all other users' do
    expect(page).to have_css("img[src*='https://randomuser.me/api/portraits/men/1.jpg']")
    expect(page).to have_css("img[src*='https://randomuser.me/api/portraits/women/1.jpg']")
  end

  it 'can see the post counter of all other users' do
    expect(page).to have_content(@user1.posts_counter)
    expect(page).to have_content(@user1.posts_counter)
  end

  it 'links to the users#show page' do
    click_link 'Simon'
    expect(page).to have_current_path user_path(@user1.id)
  end
end
