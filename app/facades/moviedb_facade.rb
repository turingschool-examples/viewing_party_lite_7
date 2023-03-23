# require 'ostruct'

class MoviedbFacade

  # def self.movie_search
  #   movie_list = {
  #     movies: get_movies
  #     cast: get_cast
  #     comments: get_comments
  #   }
  #   Movie.new(movie_list)
  # end


  # def get_movies(keyword)
  #   top_20 = MoviedbService.fetch_api("")
  # end

  #####

  # def self.top_movie_info
  #   movie_list = {
  #     top_movies: get_top_movies # [{}]
  #   }
  #   # x = MovieInfo.new(movie_list)
  #   require 'pry'; binding.pry
  # end

  def self.get_movie_search(word)
    search_results = MoviedbService.fetch_api("/search/movie?query=#{word}&include_adult=false")
    search_results["results"].map do |movie|
      Movie.new(movie)
    end
  end


  def self.get_top_movies
    search_results = MoviedbService.fetch_api("movie/top_rated?include_adult=false")
    search_results["results"].map do |movie|
      Movie.new(movie)
    end
  end
end