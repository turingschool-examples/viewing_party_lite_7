class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true, email: { mode: :loose, require_fqdn: true }

  has_many :viewing_parties
  has_many :movies, through: :viewing_parties
end