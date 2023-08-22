class User < ApplicationRecord
  has_many :viewing_parties
  has_many :movies, through: :viewing_parties
end