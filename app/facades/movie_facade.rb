class MovieFacade
  def self.top_movies
    MovieService.top_rated_movies[:results].map do |movie_data| ##<-- top_rated_movies is a method in the MovieService class
      Movie.new(movie_data)
    end
  end
end