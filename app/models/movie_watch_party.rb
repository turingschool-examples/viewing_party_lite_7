class MovieWatchParty < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  belongs_to :watch_party

  enum user_status: ["attending", "hosting"]
end