# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user)
    else
      redirect_to new_user_path
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  private

  def user_params
    params.permit(:id, :name, :email)
  end
end
