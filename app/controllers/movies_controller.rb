# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = SearchFacade.new(params).movies
    return unless !params[:title].nil? && params[:title].empty?

    flash[:alert] = 'Error: Input must be at least 1 charachter'
    redirect_to "/users/#{@user.id}/discover"
  end

  def show
    @movie = SearchFacade.new(params).movies
    @user = User.find(params[:user_id])
  end
end
