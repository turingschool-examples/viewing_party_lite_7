class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    new_user = User.create!(name: params[:name], email: params[:email])
    redirect_to user_path(new_user)
  end

  def show
    @user = User.find(params[:id])
    @parties = @user.parties
  end
end