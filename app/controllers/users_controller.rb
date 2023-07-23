# frozen_string_literal: true

class UsersController < ApplicationController
  
  def index; end

  def show
    if current_user
      @user = User.find(current_user.id)
    else
      flash[:error] = "Please log in to visit your Dashboard"
      redirect_to root_path
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      redirect_to(root_path)
      flash[:notice] = 'User successfully registered. Please log in to visit your Dashboard'
    else
      redirect_to register_path
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
