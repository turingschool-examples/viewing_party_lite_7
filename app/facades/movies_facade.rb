class MoviesFacade

  def self.top_rated_movies
    movies_data = get_top_rated_movies
    movies_data[:results].map do |movie_info|
      Movies.new(movie_info, nil, nil)
    end 
  end

  def self.get_top_rated_movies
    movies = MoviesService.fetch_api("movie/top_rated?api_key=#{ENV['MoviesDB_API_KEY']}&language=en-US&page=1")
  end

  def self.search_results(search_query)
    movies_data = get_search_results_movies(search_query)
    movies_data[:results].map do |movie_info|
      Movies.new(movie_info, nil, nil)
    end 
  end

  def self.get_search_results_movies(search_query)
    movies = MoviesService.fetch_api("search/movie?api_key=#{ENV['MoviesDB_API_KEY']}&language=en-US&query=#{search_query}&page=1&include_adult=false")
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
