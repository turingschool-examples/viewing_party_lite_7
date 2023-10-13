class UsersController < ApplicationController

  def show 
    facade = MovieFacade.new
    @user = User.find(params[:id])
    @movies = []
    @user.parties.uniq.each do |party|
      @movies << facade.movie_details(party.movie_id)
      @movies
    end
  end

  def new
    @user = User.create(item_params)
  end
  
  def create
    @user = User.create(item_params)
    redirect_to user_path(@user.id)
  end

  private
  def item_params
    params.permit(:name, :email)
  end 
end