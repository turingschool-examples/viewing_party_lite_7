class WatchParty < ApplicationRecord
  belongs_to :movie

  has_many :movie_watch_parties
  has_many :users, through: :movie_watch_parties
end