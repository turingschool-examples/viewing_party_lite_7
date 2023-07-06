class User < ApplicationRecord
  has_many :movie_watch_parties

  has_many :movies, through: :watch_parties
  has_many :watch_parties, through: :movie_watch_parties

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
end