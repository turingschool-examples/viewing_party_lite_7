# frozen_string_literal: true

# Facade for movie search functionality

class MovieSearchFacade
  attr_reader :search_term, :movies

  def initialize(search_term)
    @search_term = search_term
    @movies = search_results
  end
  def search_results
    service = MovieSearchService.new
    json = service.movie_search(@search_term)
    json[:results].take(20).map do |movie|
      MovieSearch.new(movie)
    end
  end

# require 'pry'; binding.pry
end
