# User model for the database. This model is used to store user information
class User < ApplicationRecord
  has_many :party_users
  has_many :parties, through: :party_users

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true
  validates :password, confirmation: { case_sensitive: true }
  
  has_secure_password

  def hosted_parties
    parties.where(host_id: id)
  end

  def invited_to_parties
    parties.where.not(host_id: id)
  end
end
