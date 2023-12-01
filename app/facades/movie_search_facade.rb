class MovieSearchFacade
  def initialize(search_params)
    @search_params = search_params
  end

  def movies
    service = MovieService.new

    json = service.search_movies(@search_params)
    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end