class MoviesController < ApplicationController
  def index 
    @user = User.find(params[:user_id])
    @facade = MoviesSearchFacade.new(params[:search])
    #require 'pry';binding.pry
  end
end