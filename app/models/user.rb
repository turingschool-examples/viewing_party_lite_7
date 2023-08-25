class User < ApplicationRecord
  validates_presence_of :name, :email
  validates :email, uniqueness: { case_sensitive: false }
  has_many :viewing_parties
end
