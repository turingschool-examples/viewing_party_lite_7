class DetailsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @movie = SearchFacade.new.find_movie(params[:id]) 
  end
end