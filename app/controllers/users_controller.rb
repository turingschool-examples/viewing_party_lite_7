class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)

    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{user_params[:name]}"
      redirect_to user_path(new_user.id)
    else
      redirect_to register_user_path
      flash[:alert] = "Invalid credentials, please fill out form"
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end