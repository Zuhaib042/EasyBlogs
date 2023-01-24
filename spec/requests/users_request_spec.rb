require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before { get users_path }
    it 'return a succesfull response' do
      expect(response).to have_http_status(200)
    end

    it 'should render template' do
      expect(response).to render_template(:index)
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('List of all users goes here')
    end
  end

  describe 'GET /show' do
    before(:example) do
      @user = User.create(
        name: 'Doe John',
        photo: 'http://placeimg.com/640/480/any',
        bio: 'I am a develpoer',
        posts_counter: 2
      )
      get user_path(@user)
    end

    it 'return a succesfull response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render template' do
      expect(response).to render_template('show')
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('Details of a specific user would be displayed here')
    end
  end
end
