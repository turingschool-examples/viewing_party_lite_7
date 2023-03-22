# require 'ostruct'

class MoviedbFacade

  def self.movie_search(keyword)
    movie_list = {
      movies: get_movies(keyword)
    }
    MovieInfo.new(movie_list)
  end

  def get_movies(keyword)
    top_20 = MoviedbService.fetch_api("")

  end

  #####

  def self.top_movie_info
    movie_list = {
      top_movies: get_top_movies
    }
    MovieInfo.new(movie_list)
  end

  def get_top_movies
    search_results = MoviedbService.fetch_api("/movie/top_rated")
    new_hash = {}
    
    search_results.each do |movie|
      new_hash = { 
        movie_id: movie[:id]
        movie_title: movie[:title]
        movie_vote_avg: movie[:vote_count]
        movie_summary: movie[:overview]
      }
    end

      new_hash 
      # movie[:gene] <- array of codes?
      # runtime
      # reviews
      # cast
    end
  end

end