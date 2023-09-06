# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
  end

  def new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      flash[:success] = 'User successfully created'
      redirect_to user_path(new_user)
    else
      flash[:error] = "Error: #{new_user.errors.full_messages.to_sentence}"
      redirect_to register_path
    end
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.name}"
      redirect_to user_path(user)
    else
      flash[:error] = "Sorry, your credentials are bad"
      render :login_form
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
