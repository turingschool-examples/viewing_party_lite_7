class UserViewingPartiesController < ApplicationController
  before_action :find_movie, only: [:create]
  before_action :find_user, only: [:create]

  def create
    @viewing_party = ViewingParty.new(viewing_party_params)
    if @viewing_party.save
      @users.each do |user|
        if params[user.name] == '1'
          @viewing_party.users << user
        end
      end
      redirect_to "/users/#{params[:id]}"
    else
      flash.notice = 'Please Fill in All Fields'
      redirect_to "/users/#{params[:id]}/movies/#{params[:movies_id]}/viewing_parties/new"
    end
  end

  private

  def find_movie
    @movie = facade.movie
  end

  def find_user
    @user = User.find(params[:id])
  end

  def find_users
    @users = User.all
  end

  def viewing_party_params
    params.permit(:movie_id, :duration, :when, :start_time)
  end

  def facade
    MovieFacade.new(params[:movies_id])
  end
end
