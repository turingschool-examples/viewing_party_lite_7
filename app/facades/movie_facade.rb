class MovieFacade
  def initialize(params)
    @params = params
  end

  def movies
    @params.nil? ? top_movies : search_movies(@params)
  end

  def movie_details(id)
    data = service.movie_details(id)
    Movie.new(data)
  end

  private

  def top_movies
    data = service.top_movies
    data.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def search_movies(query)
    data = service.search_movies(query)
    data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def service
    @_service ||= MovieDbService.new
  end
end