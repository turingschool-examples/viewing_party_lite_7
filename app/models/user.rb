class User < ApplicationRecord
  validates_presence_of :name
  validates :email, uniqueness: true, presence: true
  
  has_secure_password

  has_many :user_parties
  has_many :parties, through: :user_parties
end
