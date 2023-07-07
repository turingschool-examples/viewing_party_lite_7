class DiscoverController < ApplicationController
  def discover
    @movie = Movie.all
    @facade = SearchFacade.new(params[:movie])
  end
end