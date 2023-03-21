class User < ApplicationRecord
  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
