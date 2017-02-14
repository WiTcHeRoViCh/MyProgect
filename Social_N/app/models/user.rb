class User < ApplicationRecord
  after_create :create_profile

  has_secure_password

  has_one :profile
  has_many :comments, as: :commentable, dependent: :destroy

  validates :email, uniqueness: true
end
