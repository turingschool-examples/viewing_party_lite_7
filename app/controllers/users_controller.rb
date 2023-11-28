class UsersController < ApplicationController

  def show
    @user = User.find(params[:user_id])
  end
  
  def new
  end

  def create
    new_user = User.new(users_params)
    if new_user.save
      redirect_to "/users/#{new_user.id}"
    else
      flash[:notice] = "This email is already registered"
      redirect_to "/register"
    end
  end

  private
  def users_params
    params.permit(:email, :name)
  end

end
