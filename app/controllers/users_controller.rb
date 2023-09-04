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
      redirect_to dashboard_path(@user.id)
    else
      flash[:error] = 'Please fill in all fields.'
      redirect_to register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
