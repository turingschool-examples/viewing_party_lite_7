class Movie
  attr_reader :id,
              :title,
              :vote,
              :runtime,
              :genres,
              :summary,
              :cast,
              :num_reviews,
              :review_info

  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:original_title]
    @vote = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @genres = movie_data[:genres]
    @summary = movie_data[:overview]
    @cast = movie_data[:credits]
    @num_reviews = movie_data[:reviews]
    @review_info = movie_data[:reviews]
  end
end
