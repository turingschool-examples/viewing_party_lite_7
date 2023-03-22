class MoviesController < ApplicationController
  def index
    @results = MovieFacade.search_results(params[:movie_title])
    # require 'pry'; binding.pry
  end
end