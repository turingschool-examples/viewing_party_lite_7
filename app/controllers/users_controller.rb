class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: "Welcome to Viewing Party!"
    else
      redirect_to '/register', notice: "Email already exists"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end