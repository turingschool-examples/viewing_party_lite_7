class MoviesFacade
  attr_reader :search_results

  def initialize(params)
    @search_results = params[:movie_title]
    @movie_id = params[:id]
  end

  def search?
    if @search_results
      true
    else
      false
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

  def cast_info
   cast_data.map do |cast_data|
      Cast.new(cast_data)
    end
  end

  def review_info 
    review_data.map do |review_data|
      Review.new(review_data)
    end
  end

  def review_count
    review_info.count
  end

private 

  def review_data
    @_review_data ||= service.get_movie_review_info(@movie_id)[:results]
  end

  def cast_data
    @_cast_data ||= service.get_movie_cast_info(@movie_id)[:cast][0..9]
  end

  def service
   @_service ||= MovieService.new
  end

end
