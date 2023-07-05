# frozen_string_literal: true

class UsersController < ApplicationController
  def index; end

  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path
      flash[:notice] = "User successfully registered."
    else
      redirect_to new_user_path
      flash[:alert] = "Error: #{error_message(merchant.errors)}"
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
