class MovieWatchParty < ApplicationRecord
  has_many :movies
  has_many :users
  has_many :watch_parties

  enum user_status: ["attending", "hosting"]
end