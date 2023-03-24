class PartiesController < ApplicationController
  def new
    @movie_facade = MovieFacade.new(params[:movie_id])
    @users = User.all
  end
end