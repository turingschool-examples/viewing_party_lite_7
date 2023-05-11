class User < ApplicationRecord
  has_many :partygoers
  has_many :parties, through: :partygoers

  validates :user_name, presence: true
  validates :email, presence: true, uniqueness: true
end
