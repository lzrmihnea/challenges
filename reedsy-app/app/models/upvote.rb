class Upvote < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :book, class_name: 'Book'
end
