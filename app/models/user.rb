class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true, email: { mode: :loose, require_fqdn: true }

  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties
end