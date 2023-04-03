class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  
  # validates :password_confirmation, presence: true
  # this is the same as above: validates_confirmation_of :password
  # none of these are necessary because we have this line:

  has_secure_password
  
  has_many :party_users
  has_many :parties, through: :party_users
end