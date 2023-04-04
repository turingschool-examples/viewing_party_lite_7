# frozen_string_literal: true
class UsersController < ApplicationController
  def new; end

  def create
    user = User.new(user_params)
    if user.valid? && user.password == user.password_confirmation
      user.save
      session[:user_id] = user.id
      flash[:notice] = "#{user.name} has been created!"
      redirect_to user_path(user)
    else
      flash[:notice] = user.errors.full_messages.join(". ")
      redirect_to register_path
    end
  end

  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
    @other_users = User.other_users(@user.id)
  end

  def login_form; end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash[:notice] = "Invalid Credentials"
      redirect_to login_path
    end
  end

  def logout_user
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end