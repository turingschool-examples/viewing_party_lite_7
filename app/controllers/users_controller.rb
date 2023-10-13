# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new; end

  def create
    user = User.new(user_params)
    if !user.save
      flash.now[:alert] = if params.require(:user)[:name] == '' || params.require(:user)[:email] == ''
                            'Missing Inputs'
                          else
                            'Email already in use'
                          end
      render :new
    else
      redirect_to user_path(user)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
