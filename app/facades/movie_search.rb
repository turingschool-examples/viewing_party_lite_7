class MovieSearch 
  def all_movies
    service = MovieService.new
    request = service.all_movies
    @movies = request[:data].map do |movie|
      Movie.new(movie)
    end
  end

  def popular_movies
    service = MovieService.new
    request = service.popular_movies
    @movies = request[:data].map do |movie|
      Movie.new(movie)
    end
  end

  def one_movie(movie)
    service = MovieService.new
    request = service.one_movie(movie)
    @movie = Movie.new(request[:data])
  end

  def movie_search(movie)
    service = MovieService.new
    request = service.movie_search(movie)
    @movies = request[:data].map do |movie|
      Movie.new(movie)
    end
  end
end