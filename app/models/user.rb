class User < ApplicationRecord
  has_many :movies_users
  has_many :movies, through: :movies_users
  has_many :users_viewing_parties
  has_many :viewing_parties, through: :users_viewing_parties
end
