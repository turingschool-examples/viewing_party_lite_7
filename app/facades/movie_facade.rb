class MovieFacade
  def self.top_rated
    MovieService.top_rated_movies[:results].map do |movie|
      Movie.new(movie)
    end
  end
  
  def self.movie_search(query)
    MovieService.search(query)[:results].map do |movie|
      Movie.new(movie)
    end
  end
end