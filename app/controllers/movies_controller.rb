class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(params[:user_id])

    if params[:q] == "top rated"
      @movies = MovieFacade.get_top_rated  # need to return Top 20 from API call, suggest cached instance here
    end


    # good time to run async operations to add details for movies returned here so if a user clicks on
    # a movie, the data is hopefully preloaded into memory (api call already complete)
  end

  def show
    @movie = ""
  end
end
