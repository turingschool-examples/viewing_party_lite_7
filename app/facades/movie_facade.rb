class MovieFacade

  def self.top_rated_movies
    movies = TmbdService.top_rated_movies
    create_movies(movies)
  end

  def self.search_movies(search)
    movies = TmbdService.search_movies(search)
    create_movies(movies)
  end

  private
  def self.create_movies(movies)
    movies[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end