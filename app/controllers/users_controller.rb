# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    @user = User.find(params[:id])
    if @user.save
      redirect_to user_path
      flash[:notice] = "User successfully registered."
    else
      redirect_to new_user_path
      flash[:alert] = "Error: #{error_message(merchant.errors)}"
    end
  end
end
