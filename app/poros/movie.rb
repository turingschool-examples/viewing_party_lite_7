class Movie
  attr_reader :title, :vote_average, :id
  @@movies_all = []

  def initialize(movie_data)
    @title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
    @id = movie_data[:id]
    @@movies_all << self
  end

  def self.all
    @@movies_all
  end
end