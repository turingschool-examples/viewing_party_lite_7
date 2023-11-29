class Movie < ApplicationRecord
  has_many :party_movies
  has_many :parties, through: :party_movies
  validates :title, presence: true
  validates :runtime, presence: true

  def self.top_movies
    # all filter by rating asc then limit(20)
  end

end