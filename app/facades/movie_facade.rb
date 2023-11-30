class MovieFacade
  attr_reader :search
  def initialize(search)
    @search = search
  end

  def movies 
    service = MovieService.new
    if !@search.nil? 
      data = service.search(@search)
    else
      data = service.top_rated_20
    end

    @movies = data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def movie
    service = MovieService.new
    data = service.get_movie(@search)
  end
end
