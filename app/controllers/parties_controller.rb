class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movid_id])
    @users = User.all
    # require 'pry'; binding.pry
  end

  def create
    require 'pry'; binding.pry
    @party = Party.create!{
      movie_id: params[:movid_id],
      

    }
  end
end
