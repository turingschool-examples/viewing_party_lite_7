class Movie < ApplicationRecord
  has_many :parties
  validates :title, presence: true
  validates :runtime, presence: true

  def self.create_from_api(movie_id)
    data = MovieService.details_api_call(movie_id)
    Movie.create!({
      title: data[:title],
      tmdb_id: data[:id],
      runtime: data[:runtime]
    })
  end

end

