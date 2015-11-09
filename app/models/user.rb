class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  ##### ASSOCIATIONS #####
  has_many :topics
  has_many :comments

  ##### VALIDATIONS #####
  validates :username, presence: { message: 'Username is required.' },
    uniqueness: { message: 'Username is already taken.' }
  validates :email, presence: { message: 'Email is required.' },
    uniqueness: { message: 'Email is already taken.' }
end
