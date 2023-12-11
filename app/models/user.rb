class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties
  has_many :movies, through: :parties
  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
  validates_presence_of :password
  validates_presence_of :password_confirmation
  validates_presence_of :password_digest

  has_secure_password
end