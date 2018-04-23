


class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }, uniqueness: true
  validates :body, presence: true, length: { minimum: 5, maximum: 1000 }
  belongs_to :user
  has_many :comments
end
