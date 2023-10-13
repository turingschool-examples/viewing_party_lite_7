class MoviesController < ApplicationController
  def index
    @movies = SearchController.new.search
  end
end
