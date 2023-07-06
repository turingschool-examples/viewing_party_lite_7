class DiscoverController < ApplicationController
  def discover
    @facade = SearchFacade.new(params[:movie])
  end
end