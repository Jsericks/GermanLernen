class Forum < ActiveRecord::Base
  ##### ASSOCIATIONS #####
  has_many :topics

  ##### VALIDATIONS #####
  validates :name, presence: { message: 'Forum requires a name.' }
  validates :is_active, inclusion: { in: [true, false], message: 'Is active must be true or false.' }
end
