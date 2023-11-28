class PartyMovie < ApplicationRecord
  belongs_to :parties
  belongs_to :movies
  validates :party_id, presence: true, numericality: true
  validates :movie_id, presence: true, numericality: true

end