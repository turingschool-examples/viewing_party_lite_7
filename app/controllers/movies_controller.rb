class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params[:title])
  end
  
  def show
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params[:id])

    # param = params[:id]

    # if param.nil?
    #   @movie = Movie.find(params[:id])
    # else
    @movie = @facade.get_movie_by_id(params[:id])
    # end
  end
end