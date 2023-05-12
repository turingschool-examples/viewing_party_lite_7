class ViewingPartiesController < ApplicationController
  def new
    user = User.find(params[:user_dashboard_id])
    @facade = MovieFacade.new(user: user, type: :details, movie_id: params[:id]).movies
    @all_users = User.all
  end
end
