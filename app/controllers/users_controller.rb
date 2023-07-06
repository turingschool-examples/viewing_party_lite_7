class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
  end

  def create
    @user = User.new
    redirect_to user_path(@user.id)
  end
end
