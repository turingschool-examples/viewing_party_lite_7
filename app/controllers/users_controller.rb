class UsersController < ApplicationController

  def show 
    @user = User.find(params[:id])
  end

  def new
    @user = User.create(user_params)
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "Name or Email cannot be blank"
      render :new
    end
  end

  private
  def user_params
    params.permit(:name, :email)
  end 
end