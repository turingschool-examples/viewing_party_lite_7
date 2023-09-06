# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_user, only: :show
  def new
    @user = User.new
  end

  def show
    @user = User.find(session[:user_id])
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

  def require_user
    unless current_user
      flash[:alert] = "You must be logged in or registered to access your dashboard."
      redirect_to root_path
    end
  end
end
