class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params[:movie] != nil && params[:movie].length < 1 
      flash[:alert] = "Error: Input must be at least 1 charachter"
      redirect_to "/users/#{@user.id}/discover"
    end
  end
end