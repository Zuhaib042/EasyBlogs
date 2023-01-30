require 'rails_helper'

RSpec.describe 'User show method ', type: :feature do
  
  before(:each) do
    @user = User.first
    visit(user_path(@user.id))
  end

  it 'shows the user"s profile picture' do
    expect(page.html).to include('user-photo')
  end
end