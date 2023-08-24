class MovieFacade
  def initialize(params)
    @params = params
  end

  def service
    MovieService.new
  end

  def top_movies
    json = service.top_rated
    json[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def movie_search(search)
    
  end
end