class MovieFacade 

  def self.top_rated_movies
    MovieService.top_rated_movies[:results][0..19].map do |movie|
      Movie.new(movie)
    end
  end

  def self.movie_search(search)
    MovieService.movie_search(search)[:results][0..19].map do |movie|
      Movie.new(movie)
    end
  end
end