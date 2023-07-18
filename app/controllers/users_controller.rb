class UsersController < ApplicationController
  before_action :get_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    elsif params[:user][:password] != params[:user][:password_confirmation]
      flash[:error] = "Password and Password Confirmation does not match."
      redirect_to new_user_path
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to new_user_path
    end
  end

  def show
    @facade = MovieFacade
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user.nil?
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to login_path
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
