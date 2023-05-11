class MoviesFacade
  def initialize(params)
    @params = params
  end

  def movies
    @params.nil? ? top_movies : search_movies
  end

  private

  def top_movies
    data = service.top_movies
    data.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def search_movies
    data = service.search_movies(@params)
    data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def service
    @_service ||= MovieDbService.new
  end
end