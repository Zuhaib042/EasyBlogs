class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: true
  has_many :likes, counter_cache: true
  has_many :comments, counter_cache: true
end
