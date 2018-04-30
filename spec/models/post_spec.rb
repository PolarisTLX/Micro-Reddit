require 'rails_helper'

RSpec.describe Post, type: :model do

  fixtures :posts

  subject { posts(:one) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a body" do
    subject.body = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without a title"  do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without a user_id" do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end
end
