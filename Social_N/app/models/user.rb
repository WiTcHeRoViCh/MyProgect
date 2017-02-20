class User < ApplicationRecord
  after_create :create_profile

  has_secure_password

  has_one :profile
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :friendships
  has_many :friends, through: :friendships, foreign_key: 'friend_id'

  validates :email, uniqueness: true
end

# friendships

# user_id:integer
# friend_id:integer
# accepted:boolean, default: false

# class Friendships
#   belongs_to :user
#   belongs_to :friend, foreign_key: 'friend_id', class_name: 'User'
# end

# user_id 1
# friend_id 2

# class User
#   has_many :friendships
#   has_many :friends, through: :friendships, foreign_key: 'friend_id'
# end

# user.friendships # (user_id 1, friend_id_2)
# user.friends # [friend_id 2]