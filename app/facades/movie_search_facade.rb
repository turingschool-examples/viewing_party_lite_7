class MovieSearchFacade
  def initialize(search_params)
    @search_params = search_params
  end

  def movies
    service = MovieSearchService.new

    json = service.search_movies(@search_params)
    movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
    @movies = movies.first(20)
  end
end