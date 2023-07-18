# frozen_string_literal: true

class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to(user_path(user))
      # redirect_to "/users/#{user.id}"
      flash[:notice] = 'User successfully registered.'
    else
      redirect_to register_path
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password]) #user.password == params[:password]
      session[:user_id] = user.id
      flash[:success]= "Welcome Back #{user.name}!"
    redirect_to user_path(user)
    else
      flash[:error] = "Sorry your email or password is incorrect"
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
