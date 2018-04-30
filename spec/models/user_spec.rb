require 'rails_helper'

RSpec.describe User, type: :model do

  fixtures :users

  subject { users(:one) }

  describe 'Validations' do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid when name is blank' do
      subject.name = "     "
      expect(subject).to_not be_valid
    end

    it 'is invalid when name is too short' do
      subject.name = "a" * 2
      expect(subject).to_not be_valid
    end

    it 'is invalid when name is too long' do
      subject.name = "a" * 26
      expect(subject).to_not be_valid
    end

    it 'is invalid when email is blank' do
      subject.email = "     "
      expect(subject).to_not be_valid
    end

    it 'is invalid when email is too short' do
      subject.email = "a" * 5
      expect(subject).to_not be_valid
    end

    it 'is invalid when email is too long' do
      subject.email = "a" * 31
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'has many posts' do
      assc = described_class.reflect_on_association(:posts)
      expect(assc.macro).to eq :has_many
    end

    it 'has many comments' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
  end
end
