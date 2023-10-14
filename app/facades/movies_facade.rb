class MoviesFacade
  def initialize(query = nil, top_rated = nil)
    @query = query
    @top_rated = top_rated
  end
  
  def movies
    movies_hash = if @top_rated
                    movie_db_service.top_rated_movies
                  elsif @query.present?
                    movie_db_service.search_movies_by_title(@query)
                  end
    
    movies_hash.map do |data|
      Movie.new(data.slice(:id, :title, :vote_average))
    end

    
  end
  
  private
  
  def movie_db_service
    MovieDbService.new
  end
end
