class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :user_parties
  has_many :parties, through: :user_parties
end