class TopMovieFacade
  def top_rated
    service = MovieService.new
    top_rated = service.top_rated_movies
  
    movies = top_rated[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def search(query)
    service = MovieService.new
    searched = service.movie_search(query)

    movies = searched[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end