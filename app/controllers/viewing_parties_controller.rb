class ViewingPartiesController < ApplicationController
  before_action :find_movie, only: [:new]
  before_action :find_user, only: %i[new create]
  def new
    @users = User.where.not(id: @user.id)
  end

  def create
    @viewing_party = ViewingParty.new(viewing_party_params)
    if @viewing_party.save
      UserViewingParty.create(user: @user.id, viewing_party: @viewing_party.id)

      # User.all.each do |user|
      #   UserViewingParty.create(user: user.id, viewing_party: viewing_party[:id])
      # end
      redirect_to "/users/#{@user.id}"
    else
      flash.notice = 'Please Fill in All Fields'
      # require 'pry';binding.pry
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

  def viewing_party_params
    params.permit(:movie_id, :duration, :when, :start_time)
  end

  def facade
    MovieFacade.new(params[:movies_id])
  end
end
