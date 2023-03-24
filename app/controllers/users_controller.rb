# frozen_string_literal: true
class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "#{@user.name} has been created!"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Cannot create! Please fill out all fields"
      redirect_to register_path
    end
  end

  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
    @other_users = User.other_users(@user.id)
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end