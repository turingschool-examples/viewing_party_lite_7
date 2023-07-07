class SearchFacade
  def initialize(movie)
    @movie = movie
  end

  def details
    service = MovieService.new
    require 'pry'; binding.pry
    json = service.movie(@movie)
    @details = json
  end
end