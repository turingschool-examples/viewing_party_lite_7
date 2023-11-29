class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  # this is aliased to Top 20
  def index
    @user = User.find(params[:user_id])
    @movies = ""  # need to return Top 20 from API call, suggest cached instance here
  end

  def show
    @movie = ""  # must conduct API call based on param[q:]
  end
end
