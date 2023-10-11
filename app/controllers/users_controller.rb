class UsersController < ApplicationController

  def show 
    @user = User.find(params[:id])
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