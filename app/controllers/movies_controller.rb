class MoviesController < ApplicationController
  def index
		if params[:movie_title]
    	@movies = MovieFacade.search_results(params[:movie_title])
		else
			@movies = MovieFacade.new.popular_movies
		end
    @user= User.find(params[:user_id])
  end

	def show
		@user = User.find(params[:user_id])
    @movie = MovieFacade.new.all_movie_details(params[:id])
	end
end