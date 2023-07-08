class UserViewingPartiesController < ApplicationController 
  def new
    @movie = MovieSearch.new.full_movie_details_by_id(params[:movie_id])
    @user = User.find(params[:user_id])
  end
end