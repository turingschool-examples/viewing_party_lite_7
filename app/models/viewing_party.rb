class ViewingParty < ApplicationRecord
  validates :movie_id, :duration, :date, :start_time, presence: true
  belongs_to :user
  has_many :party_guests
  has_many :users, through: :party_guests
end
