class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates :party_duration, :start_time, :movie_title, :movie_id, presence: true
end
