class ViewingPartiesController < ApplicationController
  def new
    @movie = params[:movie_id]
    @users = User.all
    @user = User.find(params[:id])
    @viewing_party = ViewingParty.new
  end
end
