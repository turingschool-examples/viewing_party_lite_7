class MoviesFacade
  def self.top_rated_movies
    top_rated = MoviesService.top_rated_movies
    top_rated[:results][0..19].map do |movie|
      Movie.new(movie)
    end
  end

  def self.searched_movies(title)
    searched = MoviesService.searched_movies(title)
    searched[:results][0..19].map do |movie|
      Movie.new(movie)
    end
  end
end
