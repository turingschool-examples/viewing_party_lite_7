# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :name

  has_many :party_users
  has_many :viewing_parties, through: :party_users
end
