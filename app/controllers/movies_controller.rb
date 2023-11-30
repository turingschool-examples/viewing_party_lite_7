class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(params[:user_id])
    # require "pry"; binding.pry
    @movies = if params[:q] == "top rated"
      MovieFacade.get_top_rated  # need to return Top 20 from API call, suggest cached instance here
    else
      @search_term = params[:q]
      MovieFacade.movie_search(params[:q])
    end


    # good time to run async operations to add details for movies returned here so if a user clicks on
    # a movie, the data is hopefully preloaded into memory (api call already complete)
  end

  def show
    @movie = ""
  end
end
