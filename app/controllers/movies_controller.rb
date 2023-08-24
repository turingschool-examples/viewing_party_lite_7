class MoviesController < ApplicationController
  def index
    # @user = User.find(params[:id])
    @movie_facade = MovieFacade.new(params[:movie])
  end
end