require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with valid attributes"
  it "is not valid without a body"
  it "is not valid without a user_id"
  it "is not valid without a post_id"
end
