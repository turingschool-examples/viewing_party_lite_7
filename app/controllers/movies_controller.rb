class MoviesController < ApplicationController
  def index
    @movies_facade = MoviesFacade.new.search(params[:query])
    # # response = conn.get("3/movie/top_rated.json")
    @user = User.find(params[:user_id])
  end
end