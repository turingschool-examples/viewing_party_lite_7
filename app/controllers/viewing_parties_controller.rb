class ViewingPartiesController < ApplicationController
  def new
    facade = MovieFacade.new
    @user = User.find(params[:user_id])
    @users = User.where("id != #{params[:user_id]}")
    @movie = facade.movie_details(params[:movid_id])
    @party = @user.parties.new
  end

  def create
    facade = MovieFacade.new
    @user = User.find(params[:user_id])
    @users = User.where("id != #{params[:user_id]}")
    @movie = facade.movie_details(params[:movid_id])
    @party = @user.parties.new(movie_id: @movie[:id], movie_title: @movie[:title], duration: params[:duration], date: params[:date], start_time: params[:start_time])
    if @party.save
      @user.user_parties.create!(user_id: @user.id, party_id: @party.id, is_host: true)
      @users.each do |other_user|
        if params[:"#{other_user.id}"].present?
          other_user.user_parties.create!(party_id: @party.id)
        end
      end
      redirect_to user_path(@user.id)
    else
      flash[:alert] = "Error: something is wrong with credentials"
      redirect_to "/users/#{@user.id}/movies/#{@movie.id}/viewing-party/new"
    end
  end
end