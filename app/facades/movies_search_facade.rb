class MoviesSearchFacade
  attr_reader :query, :service

  def initialize(query)
    @query = query
    @service = MoviesService.new
  end

  def movies
    if @query == "Top Rated"
      self.top_movies
    else
      self.search_movies
    end
  end

  def search_movies
    @service = MoviesService.new

    json = @service.movies_by_title(@query)

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end


  def top_movies
    @service = MoviesService.new

    json = @service.top_rated

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end