class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @viewing_party = @user.viewing_parties.new
    @movie = params[:movie_data]
  end

  def create
    @user = User.find(params[:user_id])
    @viewing_party = @user.viewing_parties.new
    @movie = params[:movie_data]

    require 'pry'; binding.pry
    if params[:duration_minutes].to_i < @movie[:runtime].to_i
      flash[:error] = "Duration cannot be less than runtime - #{@movie[:runtime]} minutes"
      render :new
    else
      @viewing_party.save
    end
  end
end