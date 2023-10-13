class MoviesFacade
  def initialize(query = nil, top_rated = nil)
    @query = query
    @top_rated = top_rated
  end
  
  def movies
    if @top_rated
      movie_db_service.top_rated_movies
    elsif @query.present?
      movie_db_service.search_movies_by_title(@query)
    else
      []
    end
  end
  
  private
  
  def movie_db_service
    MovieDbService.new
  end
end
