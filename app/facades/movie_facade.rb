# frozen_string_literal: true

class MovieFacade
  def initialize(endpoint)
    @endpoint = endpoint
  end

  def movies
    results[:results]
  end

  def movie
    Movie.new(results)
  end

  def cast
    results[:cast].first(10)
  end

  def reviews
    results[:results]
  end

  def image
    results[:images]
  end

  private

  def results
    MovieService.new.get_url(@endpoint)
  end
end
