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
      create_welcome(new_user)
    elsif user.values.any?(&:empty?)
      empty_values
    elsif new_user.password != new_user.password_confirmation
      password_not_match
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def create_welcome(new_user)
    flash[:success] = "Welcome, #{new_user.name}!"
    redirect_to user_path(new_user.id)
  end

  def empty_values
    redirect_to register_path
    flash[:error] = 'Please fill out all the information to create an account'
  end

  def password_not_match
    redirect_to register_path
    flash[:error] = 'Please make sure password and password confirmation matches'
  end
end