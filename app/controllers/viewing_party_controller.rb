class ViewingPartyController < ApplicationController
  before_action :find_movie, only: [:new]
  before_action :find_user, only: [:new]
  def new
    
  end
  def create
  end



private
  def find_movie
    @movie = facade.movie
  end

  def find_user
    @user = User.find(params[:id])
  end

  def facade
    MovieFacade.new(params[:movies_id])
  end
end