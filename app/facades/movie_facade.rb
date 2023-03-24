class MovieFacade

  def pop_movies
    json = MovieService.top_movies
    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def search_results(search)
    json = MovieService.search_movies(search)
    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def all_movie_info(movie_id)
    movie_info = MovieService.movie_details(movie_id)
    cast_info = MovieService.movie_cast(movie_id)
    review_info = MovieService.movie_reviews(movie_id)
    json_info = movie_info.merge(cast_info, review_info)
    
    Movie.new(json_info)
  end
end