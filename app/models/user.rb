class User < ApplicationRecord
  validates_presence_of :name, presence: true
  validates_presence_of :email, presence: true

  has_many :user_parties
  has_many :parties, through: :user_parties
end