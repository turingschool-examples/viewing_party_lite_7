class Movie
  attr_reader :title,
              :summary,
              :vote_average,
              :movie_id,
              :runtime,
              :genres,
              :cast,
              :total_reivews_count,
              :review_info,
              :movie_id

  def initialize(info)
    @movie_id = info[:id]
    @title = info[:title]
    @summary = info[:overview]
    @vote_average = info[:vote_average]
    @runtime = info[:runtime]
    @genres = info[:genres]
    @cast = info[:cast]
    @total_reviews_count = info[:total_reviews]
    @review_info = info[:review_info]
  end
end
