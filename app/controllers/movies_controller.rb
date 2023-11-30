class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  # this is aliased to Top 20
  def index
    @user = User.find(params[:user_id])
    @movies = MovieFacade.get_top_rated  # need to return Top 20 from API call, suggest cached instance here

    # good time to run async operations to add details for movies returned here so if a user clicks on
    # a movie, the data is hopefully preloaded into memory (api call already complete)
  end

  def show
    @movie = ""  # must conduct API call based on param[q:]
  end
end
