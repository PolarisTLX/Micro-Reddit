class Comment < ApplicationRecord
  validates :body, presence: true, length: { minimum: 5, maximum: 1000 }
  belongs_to :user
  belongs_to :post
end
