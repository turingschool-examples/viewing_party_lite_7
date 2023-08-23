class MovieFacade
  def self.top_rated_movies
    MovieService.top_rated_movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end
end