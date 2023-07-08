class UserViewingPartiesController < ApplicationController 
  def new
    @movie = MovieSearch.new.full_movie_details_by_id(params[:id])
  end
end