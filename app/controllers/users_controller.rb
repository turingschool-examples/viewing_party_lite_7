class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    new_user = User.new(user_params)
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
    @user_parties = @user.user_parties
  end

  private
    def user_params
      params.permit(:name, :email, :password)
    end
end