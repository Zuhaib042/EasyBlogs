require 'rails_helper'
require 'securerandom'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject {
    Post.new(author: user,
             title: "Hello",
            text: 'This is my first post'
            )
  } 

  before { subject.save }
  
  it "is not valid with length exceeding 250 chars" do
    subject.title = SecureRandom.hex(251)
    expect(subject).to be_invalid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid when comments_counter and likes_counter is less than 0" do
    subject.likes_counter = -1
    subject.comments_counter = -2
    expect(subject).to be_invalid
  end

  it "is valid when likes_counter and comments_counter is greater than 0" do
    subject.comments_counter = 10
    subject.likes_counter = 10
    expect(subject).to be_valid
  end
  
  describe "comments" do
    before do
      6.times do
        Comment.create(author_id: user.id, post_id: subject.id , text: 'Hi Tom!' )
      end
    end
    it "should bring last 5 comments" do
    
      expect(subject.recent_comments).to eq subject.comments.order(created_at: :desc).limit(5)
    end
  end
  
end