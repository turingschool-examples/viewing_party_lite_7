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
		@movie_id = params[:id]
		@user = User.find(params[:user_id])
	end
end