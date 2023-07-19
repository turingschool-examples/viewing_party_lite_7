class UsersController < ApplicationController
  # before_action :get_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif User.exists?(email: params[:user][:email])
      flash[:error] = "Email already exists."
      redirect_to new_user_path
    elsif params[:user][:password] != params[:user][:password_confirmation]
      flash[:error] = "Password and Password Confirmation does not match."
      redirect_to new_user_path
    else
      flash[:error] = "You must fill in all fields."
      redirect_to new_user_path
    end
  end

  def show
    if current_user
      @user = User.find(current_user.id)
      @facade = MovieFacade
    else
      flash[:error] = "You must be logged in to visit that page."
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # def get_user
  #   if session[:user_id]
  #     @user = User.find(session[:user_id])
  #   else
  #     flash[:error] = "You must be logged in to visit that page."
  #     redirect_to root_path
  #   end
  # end
end
