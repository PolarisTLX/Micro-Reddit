require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with valid attributes"
  it "is not valid without a body"
  it "is not valid without a title"
  it "is not valid without a user_id"
end
