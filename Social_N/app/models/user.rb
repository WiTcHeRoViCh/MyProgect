class User < ApplicationRecord
  after_create :create_profile

  has_secure_password

  has_one :profile

  validates :email, uniqueness: true
end
