require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "associations" do
    let(:comment) { Comment.new }

    it "should have appropriate associations" do
      expect(comment).to belong_to(:user)
      expect(comment).to belong_to(:topic)
    end
  end

  context "When creating with missing or invalid attributes" do
    let(:invalid_comment) { Comment.new }

    it "should be invalid and show appropriate error messages" do
      expect(invalid_comment).not_to be_valid
      expect(invalid_comment.errors[:user_id][0]).to eql 'User is required to create a comment.'
      expect(invalid_comment.errors[:topic_id][0]).to eql 'Topic is required to create a comment.'
      expect(invalid_comment.errors[:body]).to include 'Body must be no less than 25 characters and no more than 1000.'
      expect(invalid_comment.errors[:body]).to include 'Body is required to create a comment.'
    end
  end

  context "with valid attributes" do
    let(:topic) { create(:topic, :active, :unlocked) }
    let(:valid_comment) { create(:comment, :unlocked, topic_id: topic.id, user_id: topic.user_id) }

    it "should be valid and increase topic count" do
      expect{
        valid_comment
      }.to change(Comment, :count).by 1
    end

    it "should increase the counter cache on Topic" do
      expect{
        topic.comments.create(
          body: 'I have a super fake, yet super important question that I will now ask in this topic.',
          user_id: topic.user_id
          )
      }.to change(topic, :comment_count).by 1
    end

    it "should increase the counter cache on User" do
      expect{
        topic.user.comments.create(
          body: 'I have a super fake, yet super important question that I will now ask in this topic.',
          user_id: topic.user_id,
          topic_id: topic.id
          )
      }.to change(topic.user, :comment_count).by 1
    end
  end
end
