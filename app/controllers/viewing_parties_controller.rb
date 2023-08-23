class ViewingPartiesController < ApplicationController
  def new
    require 'pry';binding.pry
    @movie = Movie.find(params[:movid_id])
    @user = User.find(params[:user_id])
    @viewing_party = @user.viewing_parties.new
  end
end