# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @parties = PartyUser.where(host: true)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user)
    else
      flash[:error] = @user.errors.full_messages.to_sentence  ##<< This covers all three sad paths in the new user spec
      render :new
    end
  end

  def login_form; end

  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to dashboard_path(user)
    else
      flash[:error] = "Sorry! Your credentials are bad."
      render :login_form
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
