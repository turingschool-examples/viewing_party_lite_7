class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(strong_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:alert] = "Please fill in all fields, email must be unique"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  
  def strong_params
    params.require(:user).permit(:email, :name)
  end
end
