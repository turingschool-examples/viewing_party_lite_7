class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates :movie_title, presence: true
  validates :duration, presence: true, numericality: { only_integer: true }
  validates :date_time, presence: true
end
