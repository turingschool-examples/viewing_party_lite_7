class WatchParty < ApplicationRecord
  has_many :movie_watch_parties
  has_many :movies, through: :movie_watch_parties
  has_many :users, through: :movie_watch_parties
end