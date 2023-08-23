class UsersController < ApplicationController

  def show 
    # @user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end

  def create 
    user = User.new(user_params)
    if user.save
      redirect_to dashboard_path(user.id)
    else
      flash[:error] = "Sorry, I'ma need you to try harder."
      redirect_to register_path
    end
  end

  private 

  def user_params
    params.permit(:name, :email)
  end

end