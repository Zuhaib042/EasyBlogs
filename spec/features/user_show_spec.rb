require 'rails_helper'

RSpec.describe 'User show method ', type: :feature do
  before(:example) do
    @user = User.create(name: 'Lilly',
                        photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2432&q=80', bio: 'Teacher from Poland.', posts_counter: 10)

    @posts = [Post.create(author: @user, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                          comments_counter: 0),
              Post.create(author: @user, title: 'Hi', text: 'This is my second post', likes_counter: 0,
                          comments_counter: 0),
              Post.create(author: @user, title: 'What"s up', text: 'This is my third post', likes_counter: 0,
                          comments_counter: 0)]
    visit user_path(@user)
  end

  it 'shows the user"s profile picture' do
    expect(page.html).to include('user-photo')
    find("img[src='#{@user.photo}']")
  end

  it 'shows the name of username' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of posts the user has written' do
    expect(page).to have_content("Number of Posts: #{@user.posts_counter}")
  end

  it 'shows the user\'s bio' do
    expect(page).to have_content(@user.bio)
  end

  it 'shows the user\'s first three posts' do
    @posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'shows the "see all posts" button' do
    find_button('See all Posts')
  end

  it 'redirects to the the clicked post link' do
    post = @posts.first
    click_link(post.title)
    expect(page).to have_current_path(user_post_path(@user, post))
  end

  it 'redirects to "posts" link' do
    click_link('See all Posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
