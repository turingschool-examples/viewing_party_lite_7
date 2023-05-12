class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(strong_params)
    if @user.save
      redirect_to user_dashboard_path(@user)
    else
      flash[:alert] = 'Please fill in all fields, email must be unique'
      redirect_to new_user_path
    end
  end

  def show
    user = User.find(params[:id])
    movie_facade = MovieFacade.new(user)
    @user_movies = movie_facade.movies_by_ids(user.viewing_party_movie_ids)
  end

  private

  def strong_params
    params.require(:user).permit(:email, :name)
  end
end
