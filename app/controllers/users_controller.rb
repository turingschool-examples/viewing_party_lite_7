# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.includes(viewing_parties: %i[movie user]).find(params[:id])
    @viewing_parties = @user.viewing_parties
    @movie_details = @viewing_parties.map do |party|
      MovieFacade.movie_details(party.movie_id)
    end
  end

  def new; end

  def create
    @user = User.new(user_params)

    return unless @user.save

    redirect_to user_path(@user)
  end

  def discover
    @user = User.find(params[:id])
    @movies_facade = MoviesFacade.new(params[:query], params[:top_rated])
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
