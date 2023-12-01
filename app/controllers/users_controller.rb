class UsersController < ApplicationController 
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:alert] = "Error: something is wrong with credentials"
      render :new
    end
  end

  def show 
    facade = MovieFacade.new
    @user = User.find(params[:id])
    @movies = []
    @user.parties.uniq.each do |party|
      @movies << facade.movie_details(party.movie_id)
      @movies
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
