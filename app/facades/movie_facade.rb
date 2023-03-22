class MovieFacade
  def initialize(movie_id)
    @movie_id = movie_id
    @service = MovieService.new
  end

  def movie
    movie = @service.movie_by_id(@movie_id)
  end
  
  def cast
    cast = @service.cast(@movie_id)
    cast.map { |cast_member| {name: cast_member[:name], character: cast_member[:character]} }
  end
end

def top_rated
  top_rated = @service.top_rated_movies

  movies = top_rated[:results].map do |movie_data|
    Movie.new(movie_data)
  end
end