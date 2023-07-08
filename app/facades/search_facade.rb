class SearchFacade
  def initialize(search=nil)
    @search = search
  end

  def movies
    service = MovieService.new

    @search.present? ? get_movies(service.search_movies(@search)) : get_movies(service.top_rates_movies)

  end

  def get_movies(movies)
    @movies = movies[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

end