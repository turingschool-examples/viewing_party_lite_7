class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movid_id])
    # @movie2 =  MovieFacade.movie_details()
    require 'pry'; binding.pry
  end
end
