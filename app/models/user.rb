class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :viewing_parties
  has_many :movies, through: :viewing_parties
end