# frozen_string_literal: true

class MovieFacade
  def initialize(movie)
    @movie = movie
  end

  def cast_members
    json = service.get_cast_members(@movie)

    json[:cast].map do |cast_data|
      CastMember.new(cast_data)
    end.first(10)
  end

  def movie
    json = service.get_movie(@movie)

    Movie.new(json)
  end

  def reviews
    json = service.get_reviews(@movie)
    json[:results].map do |review_data|
      Review.new(review_data)
    end
  end

  def top_20_movies
    json = service.get_top_movies

    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end.first(20)
  end

  def searched_movies(query)
    json = service.get_searched_movies(query)

    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end.first(20)
  end

  def service
    MovieService.new
  end
end
