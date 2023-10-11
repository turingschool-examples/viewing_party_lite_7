class Movie
  attr_reader :id, :title, :vote_average, :vote_count, :runtime, :summary, :genres
  def initialize(movie_info)
    @id = movie_info[:id]
    @title = movie_info[:title]
    @vote_average = movie_info[:vote_average]
    @runtime = movie_info[:runtime]
    @summary = movie_info[:overview]
    @genres = movie_info[:genres]
    @total_reviews = movie_info[:total_reviews]
  end
end