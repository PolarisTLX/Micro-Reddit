



class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: true
  validates :email, presence: true, length: { minimum: 6, maximum: 30 }, uniqueness: true
  has_many :posts
  has_many :comments
end
