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

    @comments = [
      Comment.create(author: @user, post: @posts[0], text: 'Hi Tom!'),
      Comment.create(author: @user, post: @posts[0], text: 'How are you'),
      Comment.create(author: @user, post: @posts[1], text: 'What are you doing tonight')
    ]

    visit user_posts_path(@user, @posts)
  end

  it 'shows a post title' do
    @posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'shows the user who wrote the post' do
    expect(page).to have_content(@user.name)
  end

  it 'shows how many comments it has' do
    expect(page).to have_content(@posts[0].comments_counter)
  end

  it 'shows how many likes it has' do
    expect(page).to have_content(@posts[0].likes_counter)
  end

  it 'shows how many likes it has' do
    @posts.each do |post|
      expect(page).to have_content(post.text)
    end
  end

  it 'shows how many likes it has' do
    @comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end

  it 'shows how many likes it has' do
    @comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
