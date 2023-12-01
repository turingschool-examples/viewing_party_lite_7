class MoviesController < ApplicationRecord
  def index
    @facade = DiscoverFacade.top_rated_movies
  end
end
