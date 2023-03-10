class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :update_comments_counter

  after_destroy :decrement_comments_counter

  private

  def decrement_comments_counter
    post.decrement!(:comments_counter)
  end

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
