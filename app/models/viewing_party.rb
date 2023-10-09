class ViewingParty < ApplicationRecord
  has_many :users_viewing_party
  has_many :users, through: :users_viewing_party
  validates :date, :start_time, :duration, :movie_id
end