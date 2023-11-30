class UsersController < ApplicationController
  def index
    @users = User.all

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.create(user_params)
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
