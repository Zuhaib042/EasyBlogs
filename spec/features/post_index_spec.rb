require 'rails_helper'

RSpec.describe 'User show method ', type: :feature do
  before(:example) do
    @user = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2432&q=80', bio: 'Teacher from Poland.', posts_counter: 10)
    
    @posts = [ Post.create(author: @user, title: 'Hello', text: 'This is my first post', likes_counter: 0,
    comments_counter: 0),
     Post.create(author: @user, title: 'Hi', text: 'This is my second post', likes_counter: 0,
    comments_counter: 0),
     Post.create(author: @user, title: 'What"s up', text: 'This is my third post', likes_counter: 0, comments_counter: 0)
     ]
    
    @comments = [
     Comment.create(author: @user, post: @posts[0], text: 'Hi Tom!' ),
     Comment.create(author: @user, post: @posts[0], text: 'How are you' ),
     Comment.create(author: @user, post: @posts[1], text: 'What are you doing tonight')
    ]
        
    visit user_posts_path(@user, @posts)
  end
  
  it 'shows the user"s profile picture' do
    expect(page.html).to include('user-photo')
    find("img[src='#{@user.photo}']")
  end
  
  it "shows the name of username" do
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of posts the user has written' do
    expect(page).to have_content("Number of Posts: #{@user.posts_counter}")
  end

  it 'shows a post title' do
    @posts.each do |post|
      expect(page).to have_content(post.title) 
    end
  end
  
  it 'shows a post body' do
    @posts.each do |post|
      expect(page).to have_content(post.text) 
    end
  end

  it 'shows a post\'s recent comments' do
    @posts[0].recent_comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'shows a comments count' do
    expect(page).to have_content(@posts[0].comments_counter)
  end

  it 'shows a comments count' do
    expect(page).to have_content(@posts[0].likes_counter)
  end

  it 'shows the pagination' do
    expect(page).to have_content('Pagination')
  end

  it 'redirects me to the post page' do
    post = @posts.first
    click_link(post.title)
    expect(page).to have_current_path(user_post_path(@user, post))
  end
  
end