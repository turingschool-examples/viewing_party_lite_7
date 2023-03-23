class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params)
      # if params[:keyword] == "top rated"
    #   @movies = MovieFacade.top_movies
    # elsif params[:keyword] != nil
    #   @movies = MovieFacade.movies_search(params[:keyword])

  end

    def show
      @facade = MovieFacade.new(params)
      # @movie = @facade.movie_details
    end
end