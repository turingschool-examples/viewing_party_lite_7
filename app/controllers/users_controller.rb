class UsersController < ApplicationController
  def new
    
  end

  def discover
    
  end

  def show
    @user = User.find(params[:id])
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
    params.permit(:name, :email)
  end
end