class Topic < ActiveRecord::Base
  ##### ASSOCIATIONS #####
  belongs_to :forum, counter_cache: :topic_count
  belongs_to :user, counter_cache: :topic_count
  has_many :comments

  ##### VALIDATIONS #####
  validates :user_id, presence: { message: 'User is required to create a topic.' }
  validates :forum_id, presence: { message: 'Forum is required to create a topic.' }
  validates :title, presence: { message: 'Title is required to create a topic.' },
      length: { in: 5..100, message: 'Title must be no less than 5 characters and no more than 100' }
  validates :body, presence: { message: 'Body is required to create a topic.' },
      length: { in: 25..1000, message: 'Body must be no less than 25 characters and no more than 1000.' }
end
