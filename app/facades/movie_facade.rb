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
end