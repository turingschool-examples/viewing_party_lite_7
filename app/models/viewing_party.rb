class ViewingParty < ApplicationRecord
  has_many :users_viewing_parties
  has_many :users, through: :users_viewing_parties
  validates :date, :start_time, :duration, :movie_id, presence: true
end