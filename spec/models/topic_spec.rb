require 'rails_helper'

RSpec.describe Topic, type: :model do
  context "associations" do
    let(:topic) { Topic.new }

    it "should have appropriate associations" do
      expect(topic).to belong_to(:user)
      expect(topic).to belong_to(:forum)
      expect(topic).to have_many(:comments)
    end
  end

  context "When creating with missing or invalid attributes" do
    let(:invalid_topic) { Topic.new }

    it "should be invalid and show appropriate error messages" do
      expect(invalid_topic).not_to be_valid
      expect(invalid_topic.errors[:user_id][0]).to eql 'User is required to create a topic.'
      expect(invalid_topic.errors[:forum_id][0]).to eql 'Forum is required to create a topic.'
      expect(invalid_topic.errors[:body]).to include 'Body must be no less than 25 characters and no more than 1000.'
      expect(invalid_topic.errors[:body]).to include 'Body is required to create a topic.'
      expect(invalid_topic.errors[:title]).to include 'Title is required to create a topic.'
      expect(invalid_topic.errors[:title]).to include 'Title must be no less than 5 characters and no more than 100'
    end
  end

  context "with valid attributes" do
    let!(:forum) { create(:forum, :active) }
    let(:valid_topic) { create(:topic, :active, :unlocked, forum_id: forum.id) }
    let(:user) { create(:user) }

    it "should be valid and increase topic count" do
      expect{
        valid_topic
      }.to change(Topic, :count).by 1
    end

    it "should increase the counter cache on Forum" do
      expect{
        forum.topics.create(
          title: 'Super important question about German.',
          body: 'I have a super fake, yet super important question that I will now ask in this topic.',
          user_id: user.id
          )
      }.to change(forum, :topic_count).by 1
    end
  end
end
