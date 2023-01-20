require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'is not valid without a title' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid when posts_counter is less than 0' do
    subject.posts_counter = -1
    expect(subject).to be_invalid
  end

  it 'is valid when posts_counter is greater than 0' do
    subject.posts_counter = 20
    expect(subject).to be_valid
  end

  describe 'Posts' do
    before do
      5.times do
        Post.create(author_id: subject.id, title: 'Hello', text: 'This is my first post')
      end
    end
    it 'should bring last 3 posts' do
      expect(subject.recent_posts).to eq subject.posts.order(created_at: :desc).limit(3)
    end
  end
end
