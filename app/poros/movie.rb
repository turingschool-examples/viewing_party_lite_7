class Movie
  attr_reader :title, :vote_average, :overview, :id

  def initialize(movie_data)
    @title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
    # @runtime = movie_data[:runtime]
    @overview = movie_data[:overview]
    @id = movie_data[:id]
  end

  def self.all
  end

  def self.from_api_response(movie_data)
    Movie.new(
    title: movie_data[:original_title],
    vote_average: movie_data[:vote_average],
    overview: movie_data[:overview],
    id: movie_data[:id]
    )
  end
end
