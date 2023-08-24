class SearchFacade
  def initialize(params)
    @params = params
  end

  def service
    @_movie_service ||= MovieService.new
  end

  def top_movies
    json = service.top_rated
    json[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def movie_query(keyword)
    json = service.movie_query(keyword)
    json[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def search_type
    if @params[:search] = "top_rated"
      top_movies
    else
      movie_query(@params[:search])
    end
  end
end