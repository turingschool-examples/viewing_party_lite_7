# User model for the database. This model is used to store user information
class User < ApplicationRecord
  has_many :party_users
  has_many :parties, through: :party_users

  validates_presence_of :name, :email
  validates_uniqueness_of :email, case_sensitive: false

  def hosted_parties

  end

  def invited_to_parties

  end
end


