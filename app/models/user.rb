# frozen_string_literal: true

class User < ApplicationRecord
  has_many :users_viewing_parties
  has_many :viewing_parties, through: :users_viewing_parties
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
