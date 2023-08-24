class MovieFacade
  def initialize(params)
    @params = params
  end

  def top_movies
    service = MovieService.new
    json = service.top_rated
    json[:results].map do |movie|
      Movie.new(movie)
    end
  end
end