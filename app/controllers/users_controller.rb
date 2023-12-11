class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def discover
    @user = User.find(params[:id])
  end

  def show
    @facade = UserFacade.new(params[:id])
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      flash[:success] = "Welcome, #{new_user.name}!"
      redirect_to user_path(new_user.id)
    else
      redirect_to register_path
      flash[:error] = 'Please fill out BOTH name and email to create an account'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end