# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_many :party_users
  has_many :viewing_parties, through: :party_users
end
