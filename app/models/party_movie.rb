class PartyMovie < ApplicationRecord
  belongs_to :party
  belongs_to :movie
  validates :party_id, presence: true, numericality: true
  validates :movie_id, presence: true, numericality: true

end