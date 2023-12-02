class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @movie_info = @user.my_movies
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_dashboard_path(@user)
    else
      flash[:alert] = 'Error: Please fill out all fields and use a unique email'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
