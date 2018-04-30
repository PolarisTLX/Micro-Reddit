require 'rails_helper'

RSpec.describe Comment, type: :model do

  fixtures :comments

  subject { comments(:one) }


  describe 'Validations' do
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

    it 'is invalid when body is blank' do
      subject.body = "     "
      expect(subject).to_not be_valid
    end

    it 'is invalid when body is too short' do
      subject.body = "a" * 4
      expect(subject).to_not be_valid
    end

    it 'is invalid when body is too long' do
      subject.body = "a" * 1001
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'belongs to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to post' do
      assc = described_class.reflect_on_association(:post)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
