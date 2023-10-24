# frozen_string_literal: true

# Controllers users
class UsersController < ApplicationController
  def new; end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user= User.create(user)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to user_path(new_user)
      flash[:sucess] = "Welcome, #{new_user.email}"
    else
      redirect_to register_path
      flash[:alert] = "Error: #{error_message(new_user.errors)}"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:user_id])
  end

  def login
    user = User.find_by(email: params[:email].downcase)
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "#{user.email} was successful"
      redirect_to '/'
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form
    end
  end

  def login_form
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
