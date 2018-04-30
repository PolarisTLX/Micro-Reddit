require 'rails_helper'

RSpec.describe Comment, type: :model do

  fixtures :comments

  subject { comments(:one) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a body" do
    subject.body = nil
    expect(subject).not_to be_valid
  end
  it "is not valid without a user_id" do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without a post_id" do
    subject.post_id = nil
    expect(subject).not_to be_valid
  end
end
