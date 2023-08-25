class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.new(params[:movie_id], nil).movie_details
    @users = User.where.not(id: params[:user_id]).order(:name)
  end

  def create
    # require "pry"; binding.pry
  end
end
