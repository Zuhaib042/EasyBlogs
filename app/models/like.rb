class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: true
  belongs_to :post, counter_cache: true
end
