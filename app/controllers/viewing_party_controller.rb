class ViewingPartyController < ApplicationController
  before_action :find_movie, only: [:new]
  def new
    
  end



private
  def find_movie
    @movie = facade.movie
  end

  def facade
    MovieFacade.new(params[:movies_id])
  end
end