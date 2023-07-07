class PopularFacade
  attr_reader :popular_movies
  def initialize
    @popular_movies = popular_movies
  end

  def details
    service = MovieService.new
    request = service.popular_movies
    @movies = request[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
  
end