require 'rails_helper'

RSpec.describe Post, type: :model do

  fixtures :posts

  subject { posts(:one) }


  describe 'Validations' do
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

    it 'is invalid when title is blank' do
      subject.title = "     "
      expect(subject).to_not be_valid
    end

    it 'is invalid when title is too short' do
      subject.title = "a" * 4
      expect(subject).to_not be_valid
    end

    it 'is invalid when title is too long' do
      subject.title = "a" * 51
      expect(subject).to_not be_valid
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

    it 'has many comments' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
  end
end
