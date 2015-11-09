require 'rails_helper'

RSpec.describe Forum, type: :model do
  context "associations" do
    let(:forum) { Forum.new }
    it "should have appropriate associations" do
      expect(forum).to have_many(:topics)
    end
  end

  context "when creating with missing or invalid attributes" do
    let(:invalid_forum) { Forum.new }

    it "should be invalid and show appropriate error messages" do
      expect(invalid_forum).not_to be_valid
      expect(invalid_forum.errors[:name][0]).to eql 'Forum requires a name.'
    end
  end

  context "when creating with valid attributes" do
    let(:valid_forum) { create(:forum, :active) }

    it "should create a forum and increase count in forums table" do
      expect{
        valid_forum
      }.to change(Forum, :count).by 1
    end
  end
end
