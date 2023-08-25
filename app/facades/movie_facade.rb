class MovieFacade

  def self.get_top_rated_movies
    MovieService.find_top_rated[:results][0..19].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.get_movie_details(id) 
    movie = MovieService.find_movie(id)
    # reviews = MovieService.find_reviews(id)
    x = Movie.new(movie)
    # require 'pry'; binding.pry
  end

end