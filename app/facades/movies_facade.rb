class MoviesFacade

  def self.top_rated_movies
    movies_data = get_top_rated_movies
    movies_data[:results].map do |movie_info|
      Movies.new(movie_info)
    end 
  end

  def self.get_top_rated_movies
    movies = MoviesService.fetch_api("movie/top_rated?api_key=#{ENV['MoviesDB_API_KEY']}&language=en-US&page=1")
  end

  def self.search_results(search_query)
    movies_data = get_search_results_movies(search_query)
    movies_data[:results].map do |movie_info|
      Movies.new(movie_info)
    end 
  end

  def self.get_search_results_movies(search_query)
    movies = MoviesService.fetch_api("search/movie?api_key=#{ENV['MoviesDB_API_KEY']}&language=en-US&query=#{search_query}&page=1&include_adult=false")
  end
end
