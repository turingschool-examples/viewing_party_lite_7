# app/controllers/viewing_parties_controller.rb

class ViewingPartiesController < ApplicationController
  def new
    @movie = MovieSearch.new(params[:movie_id])
    @users = User.where.not(id: params[:user_id])
  end

  def create
    binding.pry
    redirect_to "/users/#{params[:user_id]}"
  end
end