require 'rails_helper'

RSpec.describe 'User index method which is also homepage', type: :feature do
  before(:example) do
    @users = [
      User.create(name: 'Lilly', photo: 'user2.jpg', bio: 'Teacher from Poland.', posts_counter: 10),
      User.create(name: 'Shelby', photo: 'user3.jpg', bio: 'Teacher from Australia.', posts_counter: 5),
      User.create(name: 'Sunny', photo: 'user4.jpg', bio: 'Teacher from india.', posts_counter: 7),
      User.create(name: 'Tom', photo: 'user1.jpg', bio: 'Teacher from Mexico.', posts_counter: 2)
    ]
    visit user_path
  end
  it 'shows usernames of all users' do
    @users.each do |user|
      expect(page).to have_content(user.name)
    end
  end
  it 'shows the profile picture of each' do
    expect(page).to have_selector(:xpath, '/html/body/div/section/div/div[1]/div[1]/img')
    expect(page).to have_selector(:xpath, '/html/body/div/section/div/div[2]/div[1]/img')
    expect(page).to have_selector(:xpath, '/html/body/div/section/div/div[3]/div[1]/img')
    expect(page).to have_selector(:xpath, '/html/body/div/section/div/div[4]/div[1]/img')
  end

  it 'shows the number of posts each user has' do
    @users.each do |user|
      expect(page).to have_content(user.posts_counter)
    end
  end

  it 'can redirect to the user"s show page when click on the username' do
    user = @users.first
    click_link(user.name)
    expect(page).to have_current_path(user_path(user))
  end
end
