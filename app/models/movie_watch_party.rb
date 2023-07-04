class MovieWatchParty < ApplicationRecord
  has_many :movies
  has_many :users
  has_many :watch_parties
end