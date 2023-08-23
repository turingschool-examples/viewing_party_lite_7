class MovieFacade
  def self.top_rated_movies
    service = TmdbService.new
    raw_movies = service.top_rated_movies[:results]
    raw_movies.map do |raw_movie|
      Movie.new(title: raw_movie[:title], 
                overview: raw_movie[:overview], 
                vote_average: raw_movie[:vote_average], 
                id: raw_movie[:id])
    end
  end

  def self.search_movies(query)
    service = TmdbService.new
    raw_movies = service.search_movies(query)[:results]
    raw_movies.map do |raw_movie|
      Movie.new(title: raw_movie[:title], 
                overview: raw_movie[:overview], 
                vote_average: raw_movie[:vote_average], 
                id: raw_movie[:id])
    end
  end
end