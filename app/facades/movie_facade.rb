class MovieFacade

  def pop_movies
    service = MovieService.new

    json = service.top_movies

    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end