class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  has_many :viewing_parties
  has_many :party_guests
  has_many :viewing_parties, through: :party_guests
end
