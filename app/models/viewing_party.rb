class ViewingParty < ApplicationRecord
  validates_presence_of :movie_title, :movie_image, :start_time
  validates_numericality_of :movie_id, :duration 

  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
end