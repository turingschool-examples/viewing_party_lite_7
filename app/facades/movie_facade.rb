class MovieFacade

  def self.top_rated_movies
    movies = TmbdService.top_rated_movies
    create_movies(movies)
  end

  def self.search_movies(search)
    movies = TmbdService.search_movies(search)
    create_movies(movies)
  end

  def self.find_movie(id)
    movie = TmbdService.find_movie(id)
    create_movie(movie)
  end

  private
  def self.create_movies(movies)
    movies[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.create_movie(movie)
    movie_data = {
      id: movie[:id],
      title: movie[:title],
      vote_average: movie[:vote_average],
      runtime: movie[:runtime],
      genres: movie[:genres].map {|genre| genre[:name]},
      summary: movie[:overview]
    }
    Movie.new(movie_data)
  end
end