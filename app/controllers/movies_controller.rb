class MoviesController < ApplicationController
  def index 
    @facade = MoviesSearchFacade.new(params[:search])
    #require 'pry';binding.pry
  end
end