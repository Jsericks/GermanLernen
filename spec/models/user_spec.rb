require 'rails_helper'

RSpec.describe User, type: :model do
  context "associations" do
    let(:user) { User.new }
    it "should have all appropriate associations" do
      expect(user).to have_many(:topics)
      expect(user).to have_many(:comments)
    end
  end

  context "When creating with missing or invalid attributes" do
    let(:user) { User.new }
    let(:current_user) { create(:user) }
    let(:duplicate_user) { User.new(FactoryGirl.attributes_for(:user)) }

    it "should be invalid and show appropriate error messages" do
      expect(user).not_to be_valid
      expect(user.errors[:username][0]).to eql 'Username is required.'
      expect(user.errors[:email][0]).to eql "can't be blank"
    end

    it "should show errors for uniqueness" do
      expect(current_user).to be_valid
      expect(duplicate_user).not_to be_valid
      expect(duplicate_user.errors[:email][0]).to eql 'has already been taken'
      expect(duplicate_user.errors[:username][0]).to eql 'Username is already taken.'
    end
  end

  context "with valid attributes" do
    let(:current_user) { create(:user) }
    
    it "should create a user and increase count in user table" do
      expect{
        current_user
      }.to change(User, :count).by 1
    end
  end
end
