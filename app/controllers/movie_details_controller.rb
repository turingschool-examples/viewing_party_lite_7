class MovieDetailsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @cast_members = MovieDetailsFacade.movie_cast(params[:movie_id])
    @details = MovieDetailsFacade.movie_details(params[:movie_id])
    @reviews = MovieDetailsFacade.movie_reviews(params[:movie_id])
  end
end