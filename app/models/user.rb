class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates :name, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password
  has_secure_password
end