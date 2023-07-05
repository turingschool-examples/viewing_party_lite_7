class UsersController < ApplicationController
  def create
    User.create!(user_params)
    redirect_to(user_path)
  end

  def new
   @user = User.new
  end
  

  def show 
    @user = User.find(params[:id])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end