class User < ApplicationRecord
  validates_presence_of :name
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_many :party_users
  has_many :parties, through: :party_users
end