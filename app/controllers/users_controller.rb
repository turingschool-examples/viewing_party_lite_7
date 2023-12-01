class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    new_user = User.new(name: params[:name], email: params[:email])
    if new_user.save
      redirect_to user_path(new_user)
      flash.notice = "User Has Been Created."
    else
      redirect_to register_path
      flash[:alert] = "Error: #{error_message(new_user.errors)}"
    end
  end

  def show
    @user = User.find(params[:id])
    @parties = @user.parties
  end
end