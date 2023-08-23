class MovieFacade
  def initialize(params)
    @params = params
  end

  def top_movies
    service = MovieService.new
    json = service.top_rated
    @movies = json[results].map do |movie|
      Movie.new(movie)
      require 'pry'; binding.pry
    end
  end
end