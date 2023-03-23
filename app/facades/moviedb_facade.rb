# require 'ostruct'

class MoviedbFacade

  def initialize
    @movie_service = MoviedbService.new
  end

  #private <- for later muahaha

  def get_movie_search(word)
    search_results = @movie_service.fetch_api("/search/movie?query=#{word}&include_adult=false")
    search_results["results"].map do |movie|
      Movie.new(movie)
    end
  end


  def get_top_movies
    search_results = @movie_service.fetch_api("movie/top_rated?include_adult=false")
    search_results["results"].map do |movie|
      Movie.new(movie)
    end
  end

    # def self.call
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


end