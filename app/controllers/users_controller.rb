# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @parties = PartyUser.where(host: true)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to dashboard_path(@user)
    else
      if @user.name.blank?
        flash[:error] = "Name can't be blank"
      elsif User.exists?(email: @user.email)
        flash[:error] = "Email already exists. Please try again."
      elsif @user.password != @user.password_confirmation
        flash[:error] = "Password and password confirmation need to match."
      end
      render :new
    end
  end

  def login_form; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
