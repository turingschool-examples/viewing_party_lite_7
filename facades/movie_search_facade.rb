class MovieSearchFacade
  def top_rated_movies
    movie_search = MoviesSearchService.new
    parsed = movie_search.top_movies[:results]
    parsed.map do |movie|
      Movie.new(movie)
    end
  end

  def search_movies(keyword)

  end

  def genre_details
    movie_search = MoviesSearchService.new
    parsed = movie_search.genre_runtime(128)
    @movie = Movie.new(parsed)
  end

  def cast_details
    movie_search = MoviesSearchService.new
    parsed = movie_search.movie_cast()
    cast_data[:cast].map do |actor|
      Movie.new(actor)
    end
  end

  def review_details
    movie_search = MoviesSearchService.new
    parsed = movie_search.movie_reviews()
    cast_data[:results].map do |review|
      Movie.new(review)
    end
  end

  def review_count
    movie_search = MoviesSearchService.new
    parsed = movie_search.movie_review_count()
    @review_count_data = Movie.new(parsed)
  end
end
