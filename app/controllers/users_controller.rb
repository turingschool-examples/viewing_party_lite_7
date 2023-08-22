class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to "/register", notice: "User could not be created"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  private
    def user_params
      params.permit(:name, :email)
    end
end