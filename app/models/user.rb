# frozen_string_literal: true

class User < ApplicationRecord
  has_many :party_users
  has_many :parties, through: :party_users

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true, confirmation: true
  has_secure_password

  def hosted_parties
    parties.where(party_users: { host: true })
  end

  def invited_parties
    parties.where(party_users: { host: false })
  end
end
