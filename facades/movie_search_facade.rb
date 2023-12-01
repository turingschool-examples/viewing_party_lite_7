class MovieSearchFacade
  def top_rated_movies
    movie_search = MoviesSearchService.new

    parsed = movie_search.top_movies[:results]

    parsed.map do |movie|
      Movie.new(movie)
    end
  end
end
