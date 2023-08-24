class MovieFacade

  def self.get_top_rated_movies
    MovieService.find_top_rated[:results][0..19].map do |movie_data|
      Movie.new(movie_data)
    end
  end



end