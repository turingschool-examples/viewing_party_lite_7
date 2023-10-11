class UsersController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def new
  end

  def create
    user = User.new(user_params)
    if !user.save
      if params[:name] == nil || params[:email] == nil
        flash.now[:alert] = "Missing Inputs"
        render :new
      else
        flash.now[:alert] = "Email already in use"
        render :new
      end
    else
      redirect_to user_path(user)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end