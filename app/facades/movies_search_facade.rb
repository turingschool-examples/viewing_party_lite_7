# frozen_string_literal: true

class MoviesSearchFacade
  attr_reader :query, :service

  def initialize(query)
    @query = query
    @service = MoviesService.new
  end

  def movies_count
    movies_data.count
  end

  def movies
    if @query == 'Top Rated'
      top_rated
    else
      searched_movies(@query)
    end
  end

  def top_rated
    json = @service.top_20_rated
    create_movies(json)
  end

  def searched_movies(query)
    json = @service.search(query)
    create_movies(json)
  end

  def create_movies(json)
    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  private

  def movies_data
    @movies_data ||= movies
  end
end
