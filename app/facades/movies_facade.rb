class MoviesFacade
  def initialize(search=nil)
    @search = search
  end

  def movies
    @search.present? ? create_movies(search_movies_data) : create_movies(top_movies_data)
  end

  private

  def service
    @_service ||= MovieService.new
  end

  def top_movies_data
    @_top_movies_data ||= service.top_rated
  end

  def search_movies_data
    @_search_movies_data ||= service.search_movies(@search)
  end

  def create_movies(movies)
    movies[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end