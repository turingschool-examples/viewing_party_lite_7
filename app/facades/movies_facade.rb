class MoviesFacade

  def top_rated_movies
    json = top_rated_movies_results
    json[:results].map do |movie_info|
      Movies.new(movie_info, nil, nil)
    end 
  end

  def top_rated_movies_results
    @_top_rated_movies ||= MoviesService.new.top_rated_movies
  end

  def search_results(search_query)
    json = MoviesService.new.search_movies(search_query)
    
    json[:results].map do |movie_info|
      Movies.new(movie_info, nil, nil)
    end 
  end

  def self.individual_movie(movie_id)
    movies_data = get_individual_movie(movie_id)  
    cast_data = get_cast_members(movie_id)
    reviews_data = get_reviews(movie_id)
    Movies.new(movies_data, cast_data, reviews_data)
  end

  def self.get_individual_movie(movie_id)
    movies = MoviesService.fetch_api("movie/#{movie_id}?api_key=#{ENV['MoviesDB_API_KEY']}&language=en-US")
  end

  def self.get_cast_members(movie_id)
    cast_members = MoviesService.fetch_api("movie/#{movie_id}/credits?api_key=#{ENV['MoviesDB_API_KEY']}&language=en-US")
  end

  def self.get_reviews(movie_id)
    reviews_info = MoviesService.fetch_api("movie/#{movie_id}/reviews?api_key=#{ENV['MoviesDB_API_KEY']}&language=en-US")
  end
end
