class Movie
  attr_reader :title, :vote_average, :runtime, :overview, :id

  def initialize(movie_data)
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @overview = movie_data[:overview]
    @id = movie_data[:id]
  end

  def self.all
  end
end
