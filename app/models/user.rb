class User < ApplicationRecord
  has_many :users_viewing_party
  has_many :viewing_parties, though: :users_viewing_party
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
end