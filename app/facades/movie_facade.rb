class MovieFacade
  def top_movies
    service = MovieService.new
    data = service.top_movies[:results]
    limit = data[0..20]
    @results = limit.map do |movie_data|
      MoviePoro.new(movie_data)
    end
  end

  def search_movies(title)
    service = MovieService.new
    data = service.search_movies(title)[:results]
    limit = data[0..20]
    @results = limit.map do |movie_data|
      MoviePoro.new(movie_data)
    end
  end

  def movie_details(id)
    service = MovieService.new
    service.movie_details(id)
  end

  def movie_cast(id)
    service = MovieService.new
    service.movie_cast(id)
  end

  def movie_reviews(id)
    service = MovieService.new
    service.movie_reviews(id)
  end
end