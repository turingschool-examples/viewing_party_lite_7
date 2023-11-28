# frozen_string_literal: true

class User < ApplicationRecord
  validates_uniqueness_of :email, uniqueness: { case_sensitive: false }
  validates_presence_of :name

  has_many :party_users
  has_many :viewing_parties, through: :party_users
end
