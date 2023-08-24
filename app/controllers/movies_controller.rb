class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params[:title])
  end
  
  def show
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params[:title])

    param = params[:movie_data]

    if param.nil?
      @movie = Movie.find(params[:id])
    else
      @movie = JSON.parse(params[:movie_data])
    end
  end
end