  class TopMoviesFacade 

    # def self.top_rated_info
    #   top_rated_movies.map do |movie|
    #     TopMoviesInfo.new(movie)
    #   end
    # end
    
    def self.top_rated_movies
      # top_rated = TopMoviesService.parse_api("/3/movie/top_rated")
      top_rated = TopMoviesService.top_rated_movies
      top_rated[:results][0..19].map do |movie|
        [movie[:original_title], #one poro Movie.new pass in movie data
        movie[:overview],
        movie[:vote_average]]
      end
    end
  end
