require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:example) do
    @user = User.create(
      name: 'Doe John',
      photo: 'http://placeimg.com/640/480/any',
      bio: 'I am a develpoer',
      posts_counter: 2
    )
    @post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post', comments_counter: 2,
                        likes_counter: 2)
  end

  describe 'GET /index' do
    before { get "/users/#{@user.id}/posts" }

    it 'should return succesfull response' do
      expect(response).to have_http_status(200)
    end

    it 'should return render the template' do
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('All posts of a specific author would be displaye here')
    end
  end

  describe 'GET /show' do
    before { get "/users/#{@user.id}/posts/#{@post.id}" }

    it 'should return succesfull response' do
      expect(response).to have_http_status(200)
    end

    it 'should return render the template' do
      expect(response).to render_template('show')
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('All details of a single post of a specific user goes here')
    end
  end
end
