class User < ApplicationRecord
  validates :email, presence: true
  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties
end
