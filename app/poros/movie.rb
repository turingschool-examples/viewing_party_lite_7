class Movie 

  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:original_title]
    @vote = movie_data[:vote_average]
    #runtime and genre comes from details endpoint
    @runtime = movie_data[:runtime]
    # further work needed on genres 
    @genres = []
    @summary = movie_data[:overview]
    # find endpoint for cast... first 10 only
    # @cast = 
    # find endpoint for review data
    # @num_reviews = 
    # @review_info = 
  end

  def get_genres
    [:genres].each do |hash|
      @genres << [:name]
    end
  end
end