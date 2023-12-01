class MovieFacade
  def initialize(tmdb_id)
    @tmdb_id = tmdb_id
    @movie = movie
  end

  def movie
    service = MovieService.new
    
    json = service.all_details(@tmdb_id)
    require 'pry'; binding.pry
    
    @movie = MovieData.new(json)
  end
end