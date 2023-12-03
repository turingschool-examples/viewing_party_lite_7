class ViewingPartiesController < ApplicationController
  before_action :find_movie, only: [:new]
  before_action :find_user, only: [:new]
  def new
    @users = User.where.not(id: @user.id)
  end

  private

  def find_movie
    @movie = facade.movie
  end

  def find_user
    @user = User.find(params[:id])
  end

  def viewing_party_params
    params.permit(:movie_id, :duration, :when, :start_time)
  end

  def facade
    MovieFacade.new(params[:movies_id])
  end
end
