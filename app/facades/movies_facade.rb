class MoviesFacade
  attr_reader :search_results

  def initialize(params)
    @search_results = params[:movie_title]
    @movie_id = params[:id]
  end

  def service
    MovieService.new
  end

  def status
    if @search_results
      "search"
    else
      "top_20"
    end
  end
  
  def top_20
    json = service.get_top_rated_movies
    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
  
  def search_results
    json = service.get_movie_search(@search_results)
    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end    
  end

  def specific_movie
    json = service.get_specific_movie(@movie_id)
    Movie.new(json)
  end



end
