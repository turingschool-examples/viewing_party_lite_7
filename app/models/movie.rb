class Movie < ApplicationRecord
  has_many :movie_watch_parties

  has_many :users, through: :movie_watch_parties
  has_many :watch_parties, through: :movie_watch_parties
end