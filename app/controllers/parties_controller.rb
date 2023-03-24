class PartiesController < ApplicationController
  def new 
    @movie = MoviesFacade.new.get_all_movie_info(params[:movie_id])
    @user = User.find(params[:user_id])
    @all_users = User.all
  end

  def create
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.new.get_all_movie_info(params[:movie_id])
    @party = Party.new(party_params)

    if @party.duration >= @movie.raw_runtime
      require 'pry'; binding.pry
      @party.save
      params[:invites].each do |user_id|
        UserParty.create!(party_id: Party.all.last.id, user_id: user_id)
      end
      redirect_to "/users/#{@user.id}"
    else
      require 'pry'; binding.pry
      redirect_to "/users/#{@user.id}/movies/#{@movie.movie_id}/parties/new"
    end
  end

  private

  def party_params
    params.permit(:name, :party_date, :party_time, :user_id, :duration, :movie_id)
  end
end
