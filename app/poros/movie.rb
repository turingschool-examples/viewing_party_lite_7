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
    #runtime and genre comes from details endpoint
    @runtime = movie_data[:runtime]
    # further work needed on genres, comes from movie details
    @genres = movie_data[:genres].each do |hash|
      @genres + [:name]
    end
    @summary = movie_data[:overview]
    # find endpoint for cast... first 10 only
    @cast = movie_data[:cast]
    # find endpoint for review data
    @num_reviews = movie_data[:number_reviews]
    @review_info = movie_data[:review_info]
  end

  # def get_genres
  #   [:genres].each do |hash|
  #     @genres << [:name]
  #   end
  # end
end