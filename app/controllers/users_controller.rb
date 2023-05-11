class UsersController < ApplicationController
  
  def show 
    @user = User.find(params[:id])
    @parties = @user.viewing_parties
  end
  
  def new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user)
    else 
      redirect_to "/register"
      flash[:alert] = "Please fill in all fields. Email must be unique."
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end