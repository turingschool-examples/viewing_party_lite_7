class MovieFacade
  
  def self.top_rated_movies
    movies = TmbdService.top_rated_movies[:results]

    movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.search_movies(search)
    movies = TmbdService.search_movies(search)

    movies[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end