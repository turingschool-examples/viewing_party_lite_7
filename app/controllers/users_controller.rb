class UsersController < ApplicationController

  def show 
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end

  def create 
    user = User.new(user_params)
    if user.save
      flash.notice = "You have successfully registered, okurrr!"
      redirect_to user_path(user)
    else
      flash[:error] = "Sorry, I'ma need you to try harder."
      redirect_to register_path
    end
  end

  private 

  def user_params
    params[:email].downcase!
    params.permit(:name, :email)
  end

end