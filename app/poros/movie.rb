class Movie
  attr_reader :title, :vote_average, :id
  @@movies = []

  def initialize(movie_data)
    @title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
    @id = movie_data[:id]
    @@movies << self
  end

  def self.all
    @@movies
  end
end