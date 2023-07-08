class DiscoverController < ApplicationController
  def discover
    @user = User.find(params[:user_id])

    # @movie = Movie.all
    @facade = SearchFacade.new(params[:movie])
  end
end