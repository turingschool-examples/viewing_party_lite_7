# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @viewing_party = params[:viewing_party_params]
    @attendees = User.find(params[:attendees])
    @facade = MovieFacade.new(params[:id])
    @movie = @facade.get_movie_by_id(params[:movie_id])
    @image = @facade.get_movie_image_by_id(params[:movie_id])
  end
end
