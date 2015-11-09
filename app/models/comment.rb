class Comment < ActiveRecord::Base
  ##### ASSOCIATIONS #####
  belongs_to :user, counter_cache: :comment_count
  belongs_to :topic, counter_cache: :comment_count

  ##### VALIDATIONS #####
  validates :user_id, presence: { message: 'User is required to create a comment.' }
  validates :topic_id, presence: { message: 'Topic is required to create a comment.' }
  validates :body, presence: { message: 'Body is required to create a comment.' },
    length: { in: 25..1000, message: 'Body must be no less than 25 characters and no more than 1000.' }
end
