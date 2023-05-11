# frozen_string_literal: true

class MovieFacade
  def self.top_rated
    MovieService.top_rated_movies[:results].map do |movie|
      MovieDetail.new(movie)
    end
  end

  def self.get_movie(id)
    movie_info = MovieService.get_movie(id)
    movie_detail = MovieDetail.new(movie_info)
  end

  def self.keyword(movie_query)
    MovieService.search_movie(movie_query)[:results].map do |movie|
      MovieDetail.new(movie)
    end
  end
end
