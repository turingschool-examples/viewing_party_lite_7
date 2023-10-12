class ViewingPartiesController < ApplicationController
  before_action :find_movie

  def new
  end

  def create

  end

  private

  def find_movie
    @movie = facade.movie
    #require 'pry';binding.pry
  end

  def facade
    MovieFacade.new(params[:movie_id])
  end
end